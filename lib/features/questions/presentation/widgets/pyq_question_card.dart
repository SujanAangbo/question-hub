import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:popover/popover.dart';
import 'package:question_hub/core/common/snackbar.dart';
import 'package:question_hub/core/common/styles.dart';
import 'package:question_hub/core/enums/question_type.dart';
import 'package:question_hub/features/bookmark/presentation/providers/bookmark_provider.dart';
import 'package:question_hub/features/bookmark/presentation/providers/doubt_provider.dart';
import 'package:question_hub/features/questions/presentation/widgets/report_dialog.dart';

import '../../../../models/pyq_model.dart';
import '../../../../utils/ui/sized_box.dart';
import '../providers/question_provider.dart';

class PYQQuestionCard extends StatelessWidget {
  final PyqModel pyq;

  const PYQQuestionCard({super.key, required this.pyq});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showPopover(
          context: context,
          bodyBuilder: (context) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final isContains = ref.watch(
                      isQuestionBookmarkedProvider(pyq.question.id),
                    );
                    return IconButton(
                      onPressed: () {
                        if (isContains) {
                          ref
                              .read(questionProvider.notifier)
                              .removeBookmark(context, pyq.question);
                        } else {
                          ref
                              .read(questionProvider.notifier)
                              .addToBookmark(context, pyq.question);
                        }
                        context.router.pop();
                      },
                      icon: Icon(
                        isContains
                            ? Icons.bookmark_add
                            : Icons.bookmark_add_outlined,
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final isContains = ref.watch(
                      isQuestionDoubtedProvider(pyq.question.id),
                    );
                    return IconButton(
                      onPressed: () {
                        if (isContains) {
                          showSnackBar(
                            context: context,
                            message: "Question is already in doubt list",
                            status: SnackBarStatus.error,
                          );
                          return;
                        }
                        ref
                            .read(doubtProvider.notifier)
                            .addDoubt(context, pyq.question);
                      },
                      icon: Icon(
                        Icons.question_mark,
                        color: isContains ? Colors.green : null,
                      ),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    context.router.pop();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ReportDialog(pyq: pyq);
                      },
                    );
                  },
                  icon: Icon(Icons.report_gmailerrorred),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pyq.question.content.first.type != QuestionType.markdown) ...[
              Text(
                pyq.sn.toString(),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              8.widthBox,
            ],

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pyq.question.content.map((content) {
                  final isFirst = pyq.question.content.first == content;
                  if (content.type == QuestionType.markdown) {
                    return GptMarkdown(
                      (isFirst ? '**${pyq.sn}.**  ' : '') +
                          content.data['markdown'],
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.justify,
                    );
                  } else if (content.type == QuestionType.html) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Html(
                        data: content.data['html'],
                        shrinkWrap: true,
                        style: htmlStyle(false),
                        extensions: [TableHtmlExtension()],
                      ),
                    );
                  } else if (content.type == QuestionType.image) {
                    return Image.network(
                      content.data['image'],
                      fit: BoxFit.fill,
                    );
                  }
                  return SizedBox();
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
