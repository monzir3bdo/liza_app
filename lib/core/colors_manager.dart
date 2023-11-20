import 'dart:ui';

abstract class ColorsManager {
  static final Color white = HexColor.fromHex('#FFFFFF');
  static final Color black = HexColor.fromHex('#000000');
}

extension HexColor on Color {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
