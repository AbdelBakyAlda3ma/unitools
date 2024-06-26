import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontFamily: 'SF-Pro-Text',
    fontWeight: FontWeight.bold,
    fontSize: 32.0,
  );
  static const TextStyle h2 = TextStyle(
    fontFamily: 'SF-Pro-Text',
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
  );
  static const TextStyle body1 = TextStyle(
    fontFamily: 'SF-Pro-Text',
    fontWeight: FontWeight.w400,
    fontSize: 20.0,
  );
  static const TextStyle body2 = TextStyle(
    fontFamily: 'SF-Pro-Text',
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
  );
}
