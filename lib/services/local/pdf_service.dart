// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui';
//
// import 'package:flutter/material.dart' as widget;
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html_table/flutter_html_table.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';
// import 'package:printing/printing.dart';
//
// import '../../models/pyq_model.dart';
//
// final pdfService = Provider.family(
//   (ref, widget.BuildContext context) => PdfService(context: context),
// );
//
// class PdfService {
//   PdfService({required this.context});
//
//   widget.BuildContext context;
//
//   Future<Uint8List> generatePdf(Map<int, List<PyqModel>> questionsData) async {
//     final pdf = Document();
//
//     final years = questionsData.keys.toList();
//
//     for (int i = 0; i < years.length; i++) {
//       int year = years[i];
//       final pyqs = questionsData[year] ?? [];
//
//       final tableImage = await prepareTableImages(pyqs);
//
//       final uiData = _getYearQuestionUi(year, pyqs, tableImage);
//
//       pdf.addPage(
//         Page(
//           build: (context) => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [uiData],
//           ),
//         ),
//       );
//     }
//
//     return await pdf.save();
//   }
//
//   void previewPdf(Uint8List pdfBytes) {
//     Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfBytes);
//   }
//
//   Future<String> savePdf(Uint8List bytes) async {
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/my_file.pdf');
//     await file.writeAsBytes(bytes);
//     return file.path;
//   }
//
//   Future<Map<int, Uint8List?>> prepareTableImages(
//     List<PyqModel> questions,
//   ) async {
//     Map<int, Uint8List?> images = {};
//
//     for (final q in questions) {
//       if (q.questions.table != null) {
//         final img = await _buildTable(context, q.questions.table!);
//         images.putIfAbsent(q.id, () => img);
//       } else {
//         images.putIfAbsent(q.id, () => null); // or null placeholder
//       }
//     }
//
//     return images;
//   }
//
//   Widget _getYearQuestionUi(
//     int year,
//     List<PyqModel> questions,
//     Map<int, Uint8List?> tableData,
//   ) {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           margin: EdgeInsets.symmetric(horizontal: 10),
//           padding: EdgeInsets.symmetric(vertical: 4),
//           decoration: BoxDecoration(
//             // color: PdfColor.fromHex(ColorPalette.info),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Text(
//             year.toString(),
//             textAlign: TextAlign.center,
//             // style: pw.Theme.of(context).textTheme.titleLarge,
//           ),
//         ),
//         SizedBox(height: 8),
//         _groupQuestionWidget(questions, tableData),
//       ],
//     );
//   }
//
//   _groupQuestionWidget(
//     final List<PyqModel> questions,
//     Map<int, Uint8List?> tableData,
//   ) {
//     Map<int, List<PyqModel>> groupQuestions = _groupQuestion(questions);
//
//     return ListView.builder(
//       itemCount: groupQuestions.length,
//       itemBuilder: (context, index) {
//         final key = groupQuestions.keys.toList()[index];
//         final groupQuestion = groupQuestions[key] ?? [];
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               child: Text(
//                 "Group: ${key}",
//                 // style: Theme.of(context).textTheme.titleLarge,
//               ),
//             ),
//             _buildQuestionsWidget(groupQuestion, tableData),
//           ],
//         );
//       },
//     );
//   }
//
//   Map<int, List<PyqModel>> _groupQuestion(final List<PyqModel> questions) {
//     Map<int, List<PyqModel>> groupQuestions = {};
//
//     for (int i = 0; i < questions.length; i++) {
//       final question = questions[i];
//
//       if (groupQuestions.containsKey(question.group)) {
//         groupQuestions[question.group]!.add(question);
//       } else {
//         groupQuestions.putIfAbsent(question.group, () => [question]);
//       }
//     }
//
//     return groupQuestions;
//   }
//
//   Widget _buildQuestionsWidget(
//     List<PyqModel> questions,
//     Map<int, Uint8List?> tableData,
//   ) {
//     return ListView.builder(
//       itemCount: questions.length,
//       itemBuilder: (context, index) {
//         final pyq = questions[index];
//         return Column(
//           children: [_pyqQuestionCardWidget(pyq, tableData[pyq.id])],
//         );
//       },
//     );
//   }
//
//   Widget _pyqQuestionCardWidget(PyqModel question, Uint8List? tableData) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 2),
//             child: Text(
//               question.sn.toString(),
//               // style: Theme.of(context).textTheme.titleSmall,
//             ),
//           ),
//           SizedBox(width: 8),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // ...formatQuestion(context, pyq.questions.question!),
//                 if (tableData != null) ...[
//                   Center(
//                     child: Image(MemoryImage(tableData), fit: BoxFit.contain),
//                   ),
//                 ],
//                 //
//                 // if (pyq.questions.image != null) ...[
//                 //   ImageOverlay(imageUrl: question.questions.image!),
//                 // ],
//                 //
//                 // if (pyq.questions.trailing != null) ...[
//                 //   ...formatQuestion(context, question.questions.trailing!),
//                 // ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Widget _buildImage(String imageUrl) {
//   //   return Image(NetworkImage(imageUrl), fit: BoxFit.contain);
//   // }
//
//   Future<Uint8List> _buildTable(
//     widget.BuildContext context,
//     String tableData,
//   ) async {
//     final boundary = widget.RepaintBoundary(
//       child: Html(
//         data: tableData,
//         shrinkWrap: true,
//         style: {
//           "th": Style(
//             backgroundColor: widget.Colors.grey[300],
//             border: widget.Border.all(color: widget.Colors.black, width: 0.1),
//             textAlign: widget.TextAlign.center,
//             padding: HtmlPaddings.all(4),
//           ),
//           "td": Style(
//             border: widget.Border.all(color: widget.Colors.black, width: 0.1),
//             textAlign: widget.TextAlign.center,
//             padding: HtmlPaddings.all(4),
//           ),
//           "body": Style(fontFamily: 'Lora', fontSize: FontSize(16)),
//           "code": Style(fontFamily: 'JetBrainsMono'),
//         },
//         extensions: [TableHtmlExtension()],
//       ),
//     );
//     final image = await boundary
//         .createRenderObject(context)
//         .toImage(pixelRatio: 3);
//     final byteData = await image.toByteData(format: ImageByteFormat.png);
//     return byteData!.buffer.asUint8List();
//   }
//
//   // List<Widget> formatQuestion(widget.BuildContext context, String text) {
//   //   final markDownStyle = MarkdownStyleSheet.fromTheme(Theme.of(context))
//   //       .copyWith(
//   //     p: const TextStyle(fontFamily: 'Lora', fontSize: 16, height: 1.5),
//   //     code: const TextStyle(
//   //       fontFamily: 'JetBrainsMono',
//   //       fontSize: 14,
//   //       backgroundColor: Color(0xFFF7F7F7),
//   //     ),
//   //   );
//   //
//   //   final regex = RegExp(r'(\$\$.*?\$\$)', dotAll: true);
//   //   final matches = regex.allMatches(text);
//   //
//   //   if (matches.isEmpty) {
//   //     return [MarkdownBody(data: text, styleSheet: markDownStyle)];
//   //   }
//   //
//   //   final widgets = <Widget>[];
//   //   int lastIndex = 0;
//   //
//   //   for (final match in matches) {
//   //     // Add Markdown before formula
//   //     if (match.start > lastIndex) {
//   //       widgets.add(
//   //         MarkdownBody(
//   //           data: text.substring(lastIndex, match.start),
//   //           styleSheet: markDownStyle,
//   //         ),
//   //       );
//   //     }
//   //
//   //     // Extract the formula inside $$...$$
//   //     final formula = text.substring(match.start + 2, match.end - 2).trim();
//   //
//   //     widgets.add(
//   //       Padding(
//   //         padding: const EdgeInsets.symmetric(vertical: 8),
//   //         child: Math.tex(formula, textStyle: const TextStyle(fontSize: 18)),
//   //       ),
//   //     );
//   //
//   //     lastIndex = match.end;
//   //   }
//   //
//   //   // Add any Markdown after the last formula
//   //   if (lastIndex < text.length) {
//   //     widgets.add(
//   //       MarkdownBody(
//   //         data: pyq.questions.question!.substring(lastIndex),
//   //         styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
//   //           p: const TextStyle(fontFamily: 'Lora', fontSize: 16, height: 1.5),
//   //           code: const TextStyle(
//   //             fontFamily: 'JetBrainsMono',
//   //             fontSize: 14,
//   //             backgroundColor: Color(0xFFF7F7F7),
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //   }
//   //
//   //   return widgets;
//   // }
// }
