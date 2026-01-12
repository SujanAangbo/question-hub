import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/features/questions/presentation/providers/question_provider.dart';
import 'package:question_hub/models/question_model.dart';

import '../../../../models/pyq_model.dart';

class ReportDialog extends StatelessWidget {
  ReportDialog({super.key, this.pyq, this.question}) {
    if (pyq == null && question == null) {
      throw 'Both pyq and question cannot be null';
    }

    if (pyq != null && question != null) {
      throw 'Both pyq and question cannot be non-null';
    }
  }

  final PyqModel? pyq;
  final QuestionModel? question;
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("What's wrong over here!"),
      content: TextField(controller: messageController, maxLines: 5),
      actions: [
        MaterialButton(
          textColor: Theme.of(context).primaryColor,
          color: Colors.transparent,
          elevation: 0,

          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          onPressed: () {
            context.router.pop();
          },
          child: Text("Cancel"),
        ),
        Consumer(
          builder: (context, ref, child) {
            return MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: () async {
                // add report

                if (pyq != null) {
                  await ref
                      .read(questionProvider.notifier)
                      .reportPyqQuestion(
                        question: pyq!,
                        message: messageController.text.trim(),
                        context: context,
                      );
                } else if (question != null) {
                  await ref
                      .read(questionProvider.notifier)
                      .reportQuestion(
                        question: question!,
                        message: messageController.text.trim(),
                        context: context,
                      );
                }

                context.router.pop();
              },
              child: Text("Report"),
            );
          },
        ),
      ],
    );
  }
}
