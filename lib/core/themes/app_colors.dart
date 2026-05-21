import 'package:flutter/material.dart';

class AppColors {
  static const Color purple = Color(0xFFC782E4);
  static const Color black = Color(0xFF1A1A19);
  static const Color lightBlack = Color(0xFF141C23);
  static Color shadow = const Color(0xFF000000).withValues(alpha: 0.06);
  static Color disabledText = const Color(0xFFFFFFFF).withValues(alpha: 0.6);
  static Color emailTextColor = const Color(0xFFFFFFFF).withValues(alpha: 0.8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFA0A4A9);
  static const Color descriptionGreyColor = Color(0xFFA1A1A1);
  static const Color kDividerColor = Color(0xFFE9E9E9);
  static const Color lightGrey = Color(0xFFE6E6E6);
  static const Color softPurple = Color(0xFFAA8CB6);
  static const Color borderColor = Color(0xFFF0F0F0);

  static LinearGradient storyCircleGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFC782E4),
      Color(0xFF4600DC),
    ],
    stops: [0.0, 1.0],
  );


  static LinearGradient addStoryCircleGradient = const LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [
      Color(0xFFC782E4),
      Color(0xFF4600DC),
    ],
    stops: [0.0, 1.0],
  );

}
