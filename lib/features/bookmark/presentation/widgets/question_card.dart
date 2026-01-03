import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:popover/popover.dart';
import 'package:question_hub/core/common/styles.dart';
import 'package:question_hub/features/bookmark/presentation/providers/bookmark_provider.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../../../../core/enums/question_type.dart';
import '../../../../models/question_model.dart';
import '../../../questions/presentation/providers/question_provider.dart';

class QuestionCard extends StatelessWidget {
  final QuestionModel question;
  final int? sn;

  const QuestionCard({super.key, required this.question, this.sn});

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
                      isQuestionBookmarkedProvider(question.id),
                    );
                    return IconButton(
                      onPressed: () {
                        if (isContains) {
                          ref
                              .read(questionProvider.notifier)
                              .removeBookmark(context, question);
                        } else {
                          ref
                              .read(questionProvider.notifier)
                              .addToBookmark(context, question);
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              ],
            );
          },
        );
      },
      child: Padding(
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
                      (isFirst ? '**$sn.**  ' : '') + content.data['markdown'],
                      style: Theme.of(context).textTheme.bodyMedium,
                    );
                  } else if (content.type == QuestionType.html) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Html(
                        data: content.data['html'],
                        shrinkWrap: true,
                        style: htmlStyle(true),
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

  // List<Widget> formatQuestion(BuildContext context, String text) {
  //   final markDownStyle = MarkdownStyleSheet.fromTheme(Theme.of(context))
  //       .copyWith(
  //         p: const TextStyle(fontFamily: 'Lora', fontSize: 16, height: 1.5),
  //         code: const TextStyle(
  //           fontFamily: 'JetBrainsMono',
  //           fontSize: 14,
  //           backgroundColor: Color(0xFFF7F7F7),
  //         ),
  //       );
  //
  //   final regex = RegExp(r'(\$\$.*?\$\$)', dotAll: true);
  //   final matches = regex.allMatches(text);
  //
  //   if (matches.isEmpty) {
  //     return [MarkdownBody(data: text, styleSheet: markDownStyle)];
  //   }
  //
  //   final widgets = <Widget>[];
  //   int lastIndex = 0;
  //
  //   for (final match in matches) {
  //     // Add Markdown before formula
  //     if (match.start > lastIndex) {
  //       widgets.add(
  //         MarkdownBody(
  //           data: text.substring(lastIndex, match.start),
  //           styleSheet: markDownStyle,
  //         ),
  //       );
  //     }
  //
  //     // Extract the formula inside $$...$$
  //     final formula = text.substring(match.start + 2, match.end - 2).trim();
  //
  //     widgets.add(
  //       Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 8),
  //         child: Math.tex(formula, textStyle: const TextStyle(fontSize: 18)),
  //       ),
  //     );
  //
  //     lastIndex = match.end;
  //   }
  //
  //   // Add any Markdown after the last formula
  //   if (lastIndex < text.length) {
  //     widgets.add(
  //       MarkdownBody(
  //         data: question.question!.substring(lastIndex),
  //         styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
  //           p: const TextStyle(fontFamily: 'Lora', fontSize: 16, height: 1.5),
  //           code: const TextStyle(
  //             fontFamily: 'JetBrainsMono',
  //             fontSize: 14,
  //             backgroundColor: Color(0xFFF7F7F7),
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //
  //   return widgets;
  // }
}
