import 'package:question_hub/core/constants/supabase_constants.dart';

class AppAssets {
  AppAssets._();

  static const String _svgsPath = 'assets/svgs';
  static const String _imgPath = 'assets/images';
  static final String _networkPath = SupabaseConstants.storagePath;

  static final String logoImage = '$_imgPath/logo.png';
  static final String foregroundLogo = '$_imgPath/foreground.png';
  static final String foregroundLogoImage = '$_imgPath/foreground.png';
  static final String profileImage = '$_imgPath/profile.png';

  // icons
  static final String googleIcon = '$_svgsPath/google_icon.svg';
}
