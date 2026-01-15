import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConstants {
  SupabaseConstants._();

  static String projectUrl = dotenv.env['PROJECTURL'] ?? '';
  static String apiKey = dotenv.env['APIKEY'] ?? '';

  // tables
  static String coursesTable = 'courses';
  static String pyqTable = 'pyq';
  static String questionsTable = 'question';
  static String subjectsTable = 'subjects';
  static String pyqReportTable = 'pyq_report';

  // buckets
  static String storagePath =
      'https://evtjetcsrxhjgndjmcaa.supabase.co/storage/v1/object/public/';
  static String courseBucket = 'courses';
  static String subjectBucket = 'subjects';
  static String questionBucket = 'questions';
}
