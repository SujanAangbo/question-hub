import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../models/question_block_model.dart';

/// for converting block content to the map and vice versa
class QuestionContentConverter
    extends TypeConverter<List<QuestionBlockModel>, String> {
  const QuestionContentConverter();

  @override
  List<QuestionBlockModel> fromSql(String fromDb) {
    final list = json.decode(fromDb) as List;
    return list
        .map((e) => QuestionBlockModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  String toSql(List<QuestionBlockModel> value) {
    return json.encode(value.map((e) => e.toJson()).toList());
  }
}
