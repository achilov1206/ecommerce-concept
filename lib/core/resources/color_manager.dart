import 'package:flutter/material.dart' show Color;

class ColorManager {
  static Color primary = HexColor.fromHex('#FF6E4E');
  static Color onBackground = HexColor.fromHex('#010035');
  static Color text1 = HexColor.fromHex('#010035');
  static Color grey = HexColor.fromHex('#CCCCCC');
  static Color grey2 = HexColor.fromHex('#B7B7B7');

  static Color white = HexColor.fromHex('#FFFFFF');
  static Color backgroundColor = HexColor.fromHex('#858585');
  static Color backgroundColor2 = HexColor.fromHex('#282843');
  static Color scaffoldBackgroundColor = HexColor.fromHex('#CFCFD0');

  static Color favoriteButtonColor = HexColor.fromHex("#F2F2F2");
  static Color inputBorderColor = HexColor.fromHex('#DCDCDC');
  static Color ratingColor = HexColor.fromHex('#FFB800');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(
      hexColorString,
      radix: 16,
    ));
  }
}
