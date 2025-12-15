import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:question_hub/features/home/data/models/subject_model.dart';
import 'package:question_hub/features/questions/presentation/providers/pyq_questions_provider.dart';
import 'package:question_hub/utils/ui/default_app_bar.dart';
import 'package:question_hub/utils/ui/sized_box.dart';

import '../../../../services/local/pdf_service.dart';
import '../../../../theme/color_palette.dart';
import '../../../home/data/models/pyq_model.dart';
import '../widgets/group_question_widget.dart';

@RoutePage()
class QuestionsPage extends ConsumerWidget {
  QuestionsPage({super.key, required this.subject});

  final SubjectModel subject;
  late Map<int, List<PyqModel>>? questionData;

  final ExportDelegate exportDelegate = ExportDelegate(
    ttfFonts: {
      'Inter': 'assets/fonts/Inter_18pt-Regular.ttf',
      'Inter-Italic': 'assets/fonts/Inter_18pt-Regular.ttf',
      'Inter-Bold': 'assets/fonts/Inter_18pt-Bold.ttf',
      'Inter-BoldItalic': 'assets/fonts/Inter_18pt-Medium.ttf',

      'Lora': 'assets/fonts/Lora-Regular.ttf',
      'Lora-Bold': 'assets/fonts/Lora-Bold.ttf',
      'Lora-Italic': 'assets/fonts/Lora-Bold.ttf',
      'Lora-BoldItalic': 'assets/fonts/Lora-Bold.ttf',

      'JetBrainsMono': 'assets/fonts/JetBrainsMono-Regular.ttf',
      'JetBrainsMono-Bold': 'assets/fonts/JetBrainsMono-Bold.ttf',
      'JetBrainsMono-Italic': 'assets/fonts/JetBrainsMono-Bold.ttf',
      'JetBrainsMono-BoldItalic': 'assets/fonts/JetBrainsMono-Bold.ttf',
    },
    options: ExportOptions(pageFormatOptions: PageFormatOptions.a3()),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pyqQuestionProvider(subject.id));

    // final fontData = await rootBundle.load('assets/fonts/OpenSans-Regular.ttf');

    return Scaffold(
      appBar: DefaultAppBar(title: subject.name.toString()),
      body: state.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(child: Text('No questions found'));
          }

          questionData = data;

          // return ExportFrame(
          //   exportDelegate: exportDelegate,
          //   frameId: 'question-frame',
          //   child: Text("hello world"),
          // );

          return DefaultTextStyle(
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.normal,
              inherit: false,
            ),
            child: ExportFrame(
              exportDelegate: exportDelegate,
              frameId: 'question-frame',
              child: DefaultTextStyle(
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.normal,
                  inherit: true,
                ),
                child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final key = data.keys.toList()[index];
                    final pyq = data[key] ?? [];

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                      ),
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
                            child: Text(
                              key.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          8.heightBox,
                          GroupQuestionWidgetPdf(questions: pyq),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
        error: (err, st) {
          return Center(child: Text(err.toString()));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final service = ref.watch(pdfService(context));
            // final pdfOutput = await service.generatePdf(questionsData ?? {});
            //

            final ExportOptions overrideOptions = ExportOptions(
              textFieldOptions: TextFieldOptions.uniform(interactive: false),
              checkboxOptions: CheckboxOptions.uniform(interactive: false),
            );

            // export the frame to a PDF Document
            final pdf = await exportDelegate.exportToPdfDocument(
              'question-frame',
              overrideOptions: overrideOptions,
            );
            print(pdf.document);
            final data = await pdf.save();
            service.previewPdf(data);

            // // export the frame to a PDF Page
            // final page = await exportDelegate.exportToPdfPage('question-frame');
            //
            // // export the frame to a PDF Widget
            // final widget = await exportDelegate.exportToPdfWidget(
            //   'question-frame',
            // );
          } catch (e, st) {
            log(e.toString(), stackTrace: st);
          }
        },
        child: Icon(Icons.picture_as_pdf),
      ),
    );
  }
}
