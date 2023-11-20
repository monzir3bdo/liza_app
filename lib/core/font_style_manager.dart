import 'package:flutter/material.dart';

abstract class FontManager {
  static TextStyle interSemiBold28 = const TextStyle(
    fontSize: 28,
    fontFamily: 'Inter-SemiBold',
    fontWeight: FontWeight.bold,
    color: Color(0xff1D1E20),
  );
  static TextStyle interRegular13 = const TextStyle(
      fontSize: 13, fontFamily: 'Inter-Regular', color: Color(0xff1D1E20));
  static TextStyle interMedium28 = const TextStyle(
    fontSize: 28,
    fontFamily: 'Inter-SemiBold',
    color: Color(0xff1D1E20),
  );
}
