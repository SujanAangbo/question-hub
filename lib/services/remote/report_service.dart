import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/core/constants/constants.dart';
import 'package:question_hub/core/supabase/supabase_instance.dart';
import 'package:question_hub/models/pyq_report_model.dart';

final reportServiceProvider = Provider((ref) => ReportService());

class ReportService {
  Future<void> reportQuestion(PyqReportModel data) async {
    await supabaseClient
        .from(SupabaseConstants.pyqReportTable)
        .insert(data.toJson());
  }

  Future<void> reportYearOrBatchQuestion({
    required int courseId,
    required int subjectId,
    required int year,
    required int? batch,
  }) async {}
}
