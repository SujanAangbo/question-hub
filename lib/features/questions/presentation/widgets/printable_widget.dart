import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../../../../theme/color_palette.dart';
import '../../../../utils/ui/sized_box.dart';
import '../../../home/data/models/pyq_model.dart';

class PrintableWidget extends StatelessWidget {
  const PrintableWidget({super.key, required this.questions});

  final Map<int, List<PyqModel>> questions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final key = questions.keys.toList()[index];
        final pyq = questions[key] ?? [];

        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: ColorPalette.info,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(key.toString(), textAlign: TextAlign.center),
              ),
              8.heightBox,
              PrintableGroupQuestionWidget(questions: pyq),
            ],
          ),
        );
      },
    );
  }
}

class PrintableGroupQuestionWidget extends StatelessWidget {
  PrintableGroupQuestionWidget({super.key, required this.questions}) {
    groupQuestion();
  }

  final List<PyqModel> questions;
  Map<int, List<PyqModel>> groupQuestions = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groupQuestions.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final key = groupQuestions.keys.toList()[index];
        final groupQuestion = groupQuestions[key] ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text("Group: $key"),
            ),
            PrintableYearWiseQuestionWidget(questions: groupQuestion),
          ],
        );
      },
    );
  }

  void groupQuestion() {
    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];

      if (groupQuestions.containsKey(question.group)) {
        groupQuestions[question.group]!.add(question);
      } else {
        groupQuestions.putIfAbsent(question.group, () => [question]);
      }
    }
  }
}

class PrintableYearWiseQuestionWidget extends StatelessWidget {
  const PrintableYearWiseQuestionWidget({super.key, required this.questions});

  final List<PyqModel> questions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final pyq = questions[index];
        return Column(children: [PrintablePYQQuestionCard(pyq: pyq)]);
      },
    );
  }
}

class PrintablePYQQuestionCard extends StatelessWidget {
  final PyqModel pyq;

  const PrintablePYQQuestionCard({super.key, required this.pyq});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(pyq.sn.toString()),
          ),
          8.widthBox,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...formatQuestion(context, pyq.questions.question!),
                if (pyq.questions.table != null) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Html(
                      data: pyq.questions.table,
                      shrinkWrap: true,
                      style: {
                        "table": Style(
                          // border: Border.all(color: Colors.black),
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
                        ),
                        "body": Style(
                          fontFamily: 'Lora',
                          fontSize: FontSize(16),
                        ),
                        "code": Style(fontFamily: 'JetBrainsMono'),
                      },
                      extensions: [TableHtmlExtension()],
                    ),
                  ),
                ],

                if (pyq.questions.image != null) ...[
                  Image.network(pyq.questions.image!),
                ],

                if (pyq.questions.trailing != null) ...[
                  ...formatQuestion(context, pyq.questions.trailing!),
                ],
              ],
            ),
          ),
        ],
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
