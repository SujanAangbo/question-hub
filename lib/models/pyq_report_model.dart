import 'package:freezed_annotation/freezed_annotation.dart';

part 'pyq_report_model.freezed.dart';
part 'pyq_report_model.g.dart';

@freezed
abstract class PyqReportModel with _$PyqReportModel {
  factory PyqReportModel({
    required String id,
    required int course,
    required int subject,
    required String message,
    int? year,
    int? batch,
    int? sn,
  }) = _PyqReportModel;

  factory PyqReportModel.fromJson(Map<String, dynamic> json) =>
      _$PyqReportModelFromJson(json);
}
