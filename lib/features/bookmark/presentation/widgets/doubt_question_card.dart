import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:question_hub/core/common/styles.dart';
import 'package:question_hub/models/doubt_question_model.dart';
import 'package:question_hub/theme/color_palette.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../../../../core/enums/question_type.dart';
import '../providers/doubt_provider.dart';

class DoubtQuestionCard extends StatelessWidget {
  final DoubtQuestionModel question;
  final int? sn;

  const DoubtQuestionCard({super.key, required this.question, this.sn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (sn != null) ...[
            if (question.content.first.type != QuestionType.markdown) ...[
              Text(
                sn.toString(),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              8.widthBox,
            ],
          ],

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: question.content.map((content) {
                final isFirst = question.content.first == content;
                if (content.type == QuestionType.markdown) {
                  return GptMarkdown(
                    "${isFirst ? '**${sn.toString().trim()}.**  ' : ''}"
                    "${content.data['markdown'].toString().trim()}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      decoration: question.isSolved
                          ? TextDecoration.lineThrough
                          : null,
                      color: question.isSolved ? ColorPalette.grey : null,
                    ),
                  );
                } else if (content.type == QuestionType.html) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Html(
                      data:
                          "${question.isSolved ? '<del>' : ''}"
                          "${content.data['html']}"
                          "${question.isSolved ? '</del>' : ''}",
                      shrinkWrap: true,
                      style: htmlStyle(false),
                      extensions: [TableHtmlExtension()],
                    ),
                  );
                } else if (content.type == QuestionType.image) {
                  return Image.network(content.data['image'], fit: BoxFit.fill);
                }
                return SizedBox();
              }).toList(),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return Checkbox(
                value: question.isSolved,
                onChanged: (value) {
                  ref
                      .read(doubtProvider.notifier)
                      .toggleStatus(
                        context,
                        question.copyWith(isSolved: !question.isSolved),
                      );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
