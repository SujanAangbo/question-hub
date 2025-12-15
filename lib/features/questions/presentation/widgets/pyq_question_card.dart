import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:popover/popover.dart';
import 'package:question_hub/features/bookmark/presentation/providers/bookmark_provider.dart';
import 'package:question_hub/features/home/data/models/pyq_model.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../../../../utils/ui/image_overlay.dart';
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
                      isQuestionBookmarkedProvider(pyq.questions.id!),
                    );
                    return IconButton(
                      onPressed: () {
                        if (isContains) {
                          ref
                              .read(questionProvider.notifier)
                              .removeBookmark(context, pyq.questions);
                        } else {
                          ref
                              .read(questionProvider.notifier)
                              .addToBookmark(context, pyq.questions);
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
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                pyq.sn.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            8.widthBox,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   pyq.questions.question ?? '',
                  //   style: TextStyle(color: Colors.black),
                  // ),
                  // Html(
                  //   data: pyq.questions.question,
                  //   style: {'mn': Style(color: Colors.red)},
                  // ),
                  ...formatQuestion(context, pyq.questions.question!),

                  if (pyq.questions.table != null) ...[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Html(
                        data: pyq.questions.table,
                        shrinkWrap: true,

                        style: {
                          "table": Style(
                            border: Border.all(color: Colors.black),
                          ),
                          "th": Style(
                            backgroundColor: Colors.grey[300],
                            border: Border.all(color: Colors.black, width: 0.1),
                            textAlign: TextAlign.center,
                            padding: HtmlPaddings.all(4),
                          ),
                          "td": Style(
                            border: Border.all(color: Colors.black, width: 0.1),
                            textAlign: TextAlign.center,
                            padding: HtmlPaddings.all(4),
                            color: Colors.black,
                          ),
                          "body": Style(
                            fontFamily: 'Lora',
                            fontSize: FontSize(16),
                            color: Colors.black,
                          ),
                          "code": Style(
                            fontFamily: 'JetBrainsMono',
                            color: Colors.black,
                          ),
                        },
                        extensions: [TableHtmlExtension()],
                      ),
                    ),
                  ],

                  if (pyq.questions.image != null) ...[
                    ImageOverlay(imageUrl: pyq.questions.image!),
                  ],
                  if (pyq.questions.trailing != null) ...[
                    ...formatQuestion(context, pyq.questions.trailing!),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> formatQuestion(BuildContext context, String text) {
    final markDownStyle = MarkdownStyleSheet.fromTheme(Theme.of(context))
        .copyWith(
          p: const TextStyle(fontFamily: 'Lora', fontSize: 16, height: 1.5),
          code: const TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 14,
            backgroundColor: Color(0xFFF7F7F7),
          ),
        );

    final regex = RegExp(r'(\$\$.*?\$\$)', dotAll: true);
    final matches = regex.allMatches(text);

    if (matches.isEmpty) {
      return [MarkdownBody(data: text, styleSheet: markDownStyle)];
    }

    final widgets = <Widget>[];
    int lastIndex = 0;

    for (final match in matches) {
      // Add Markdown before formula
      if (match.start > lastIndex) {
        widgets.add(
          MarkdownBody(
            data: text.substring(lastIndex, match.start),
            styleSheet: markDownStyle,
          ),
        );
      }

      // Extract the formula inside $$...$$
      final formula = text.substring(match.start + 2, match.end - 2).trim();

      widgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Math.tex(formula, textStyle: const TextStyle(fontSize: 18)),
        ),
      );

      lastIndex = match.end;
    }

    // Add any Markdown after the last formula
    if (lastIndex < text.length) {
      widgets.add(
        MarkdownBody(
          data: pyq.questions.question!.substring(lastIndex),
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            p: const TextStyle(fontFamily: 'Lora', fontSize: 16, height: 1.5),
            code: const TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 14,
              backgroundColor: Color(0xFFF7F7F7),
            ),
          ),
        ),
      );
    }

    return widgets;
  }
}
