import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';

void defaultErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.lightBlack,
    ),
  );
}