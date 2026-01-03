import 'dart:ui';

Color hexToColor(String hexString) {
  final buffer = StringBuffer();

  // Remove the # if it exists
  String cleanHex = hexString.replaceFirst('#', '');

  // If the hex is only 6 characters (RRGGBB),
  // we add 'ff' at the start for full opacity (AARRGGBB)
  if (cleanHex.length == 6) {
    buffer.write('ff');
  }

  buffer.write(cleanHex);

  // Use int.parse and toString() to get the final value
  return Color(int.parse(buffer.toString(), radix: 16));
}
