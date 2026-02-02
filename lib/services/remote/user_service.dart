import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/constants/constants.dart';
import 'package:question_hub/core/supabase/supabase_instance.dart';

final userServiceProvider = Provider((ref) => UserService());

class UserService {
  /// returns the userData in a map format and if there is not user with the
  /// given id then we are returning null
  Future<Map<String, dynamic>?> getUserById(String userId) async {
    final response = await supabaseClient
        .from(SupabaseConstants.usersTable)
        .select()
        .eq('id', userId)
        .maybeSingle();

    return response;
  }

  /// creates the user data in the supabase user table and returns the user
  /// response after creation.
  Future<Map<String, dynamic>> createUser({
    required String userId,
    required String email,
    required String name,
    String? image,
  }) async {
    final userData = {
      'id': userId,
      'email': email,
      'name': name,
      'image': image,
    };
    final response = await supabaseClient
        .from(SupabaseConstants.usersTable)
        .insert(userData)
        .select()
        .single();
    return response;
  }

  Future<Map<String, dynamic>> updateUser({
    required String userId,
    required String name,
    String? image,
  }) async {
    final userData = {'name': name};

    if (image != null) {
      userData['image'] = image;
    }

    final response = await supabaseClient
        .from(SupabaseConstants.usersTable)
        .update(userData)
        .eq('id', userId)
        .select()
        .maybeSingle();

    if (response == null) {
      throw "user not found";
    }

    return response;
  }
}
