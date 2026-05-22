import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';

class AppThemes{
  ThemeData get lightTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0
      )
  );
}