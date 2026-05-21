import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';

class CircleActionButton extends StatelessWidget {
  const CircleActionButton({super.key, required this.icon, this.onTap,});
  final String icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: AppColors.borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(icon, width: 20, height: 20),
        ),
      ),
    );
  }
}
