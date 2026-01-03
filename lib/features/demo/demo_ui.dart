import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:question_hub/services/remote/question_service.dart';

@RoutePage()
class DemoUi extends ConsumerWidget {
  const DemoUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: ref.watch(questionServiceProvider).getAllQuestion(),
        builder: (context, snapshot) {
          log("response: ${snapshot.data}");

          final listDAta = snapshot.data?.map((question) {
            final que = question as Map<String, dynamic>;
            final block = que['content'] as List<dynamic>;

            return ListView(
              shrinkWrap: true,
              children: block.map((b) {
                final d = b as Map<String, dynamic>;

                print("single data: ${d['data']['markdown']}");
                print("single data: ${d['type']}");

                if (d['type'].compareTo('markdown') == 0) {
                  return GptMarkdown(d['data']['markdown']);
                } else if (d['type'].compareTo('html') == 0) {
                  print("html data: ${d['data']['html']}");

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Html(
                      data: d['data']['html'],
                      shrinkWrap: true,

                      style: {
                        "table": Style(border: Border.all(color: Colors.black)),
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
                  );
                } else if (d['type'].compareTo('image') == 0) {
                  return Image.network(d['data']['image'], fit: BoxFit.fill);
                }
                return SizedBox();
              }).toList(),
            );
          }).toList();

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              shrinkWrap: true,
              children:
                  listDAta ??
                  [
                    Text(
                      "no "
                      "data",
                    ),
                  ],
            ),
          );
        },
      ),
    );
  }
}
