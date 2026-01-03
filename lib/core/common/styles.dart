import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:question_hub/theme/color_palette.dart';

Map<String, Style> htmlStyle([bool isStrike = false]) => {
  "table": Style(
    border: Border.all(color: isStrike ? ColorPalette.grey : Colors.black),
  ),
  "th": Style(
    backgroundColor: Colors.grey[300],
    color: isStrike ? ColorPalette.grey : Colors.black,
    border: Border.all(color: Colors.black, width: 0.1),
    textAlign: TextAlign.center,
    verticalAlign: VerticalAlign.middle,
    padding: HtmlPaddings.all(4),
    fontFamily: "Inter",
  ),
  "td": Style(
    border: Border.all(color: Colors.black, width: 0.1),
    color: isStrike ? ColorPalette.grey : Colors.black,

    textAlign: TextAlign.center,
    verticalAlign: VerticalAlign.middle,
    padding: HtmlPaddings.all(4),
    fontFamily: "Inter",
  ),
  "body": Style(
    fontFamily: 'Lora',
    color: isStrike ? ColorPalette.grey : Colors.black,
    fontSize: FontSize(16),
  ),
  "code": Style(fontFamily: 'JetBrainsMono', color: Colors.black),
  "del": Style(textDecoration: TextDecoration.lineThrough, color: Colors.grey),
};
