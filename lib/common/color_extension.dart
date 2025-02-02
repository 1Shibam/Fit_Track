import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  //! Primary colors
  static Color get primaryColorRed => const Color(0xffFF4F00);
  static Color get primaryColorOrange => const Color(0xffFE7648);
  static Color get primaryColorBlue => const Color(0xff0171DF);

  //! secondary colors - Accents & Highlights
  static Color get secondaryColorPurple => const Color(0xffA55FEF);
  static Color get secondaryColorGreen => const Color(0xff7BC678);
  static Color get secondaryColorCyan => const Color(0xff00C7D9);

  //! Neutral colors - Backgrounds & Text
  static Color get neutralColorDarkGray => const Color(0xff1C1C1E);
  static Color get neutralColorMediumGray => const Color(0xff3A3A3C);
  static Color get neutralColorSoftWhite => const Color(0xffF4F4F4);

  //! Gradients

  //? primary gradient
  static Gradient get primaryGradient => const LinearGradient(
        colors: [
          Color(0xffFF4F00), // Red
          Color(0xffFE7648), // Orange
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  //? cool gradint

  static Gradient get coolGradient => const LinearGradient(
        colors: [
          Color(0xff0171DF), // Electric Blue
          Color(0xff00C7D9), // Cyan
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  //? success gradient for achievements and progresses

  static Gradient get successGradient => const LinearGradient(
        colors: [
          Color(0xff7BC678), // Lime Green
          Color(0xffA55FEF), // Purple
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  //? for dark theme if any plan of dark theme in future
  static Gradient get darkGradient => const LinearGradient(
        colors: [
          Color(0xff1C1C1E), // Dark Gray
          Color(0xff3A3A3C), // Medium Gray
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}
