import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/supabase/supabase_instance.dart';
import 'package:uuid/uuid.dart';

final storageServiceProvider = Provider((ref) => StorageService());

class StorageService {
  Future<String> insertImage(File image, String bucket) async {
    final imageName = Uuid().v4();
    await supabaseClient.storage.from(bucket).upload(imageName, image);

    return supabaseClient.storage.from(bucket).getPublicUrl(imageName);
  }

  Future<void> deleteImage(String imageUrl, String bucket) async {
    await supabaseClient.storage.from(bucket).remove([
      imageUrl.split('/').last,
    ]);
  }
}
