import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/pyq_model.dart';
import '../providers/pyq_questions_provider.dart';

class ReportDialog extends StatelessWidget {
  ReportDialog({super.key, required this.pyq});

  final PyqModel pyq;
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
                await ref
                    .read(pyqQuestionProvider(pyq.subject).notifier)
                    .reportQuestion(
                      question: pyq,
                      message: messageController.text.trim(),
                      context: context,
                    );
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
