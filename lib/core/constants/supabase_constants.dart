import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConstants {
  SupabaseConstants._();

  static String projectUrl = dotenv.env['PROJECTURL'] ?? '';
  static String apiKey = dotenv.env['APIKEY'] ?? '';

  static String androidClientId = dotenv.env['ANDROIDCLIENTID'] ?? '';
  static String iosClientId = dotenv.env['IOSCLIENTID'] ?? '';
  static String webClientId = dotenv.env['WEBCLIENTID'] ?? '';

  // tables
  static String coursesTable = 'courses';
  static String pyqTable = 'pyq';
  static String questionsTable = 'question';
  static String subjectsTable = 'subjects';
  static String pyqReportTable = 'pyq_report';
  static String usersTable = 'users';
  static String commentsTable = 'comments';
  static String commentReportTable = 'comment_reports';

  // buckets
  static String storagePath =
      'https://evtjetcsrxhjgndjmcaa.supabase.co/storage/v1/object/public/';
  static String courseBucket = 'courses';
  static String subjectBucket = 'subjects';
  static String questionBucket = 'questions';
  static String commentBucket = 'comments';
  static String userBucket = 'users';
}
