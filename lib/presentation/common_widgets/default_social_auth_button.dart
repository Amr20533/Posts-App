import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/presentation/common_widgets/ubunto_text.dart';

class DefaultSocialAuthButton extends StatelessWidget {
  final double width;
  final Color background;
  final Color textColor;
  final VoidCallback pressed;
  final double height;
  final double fontSize;
  final String text;
  final String icon;
  final bool isUpperCase;
  final bool loading;

  const DefaultSocialAuthButton({
    super.key,
    this.width = double.infinity,
    this.background = AppColors.purple,
    this.textColor = Colors.white,
    required this.pressed,
    this.height = 50.0,
    this.fontSize = 16.0,
    required this.text,
    required this.icon,
    this.isUpperCase = true,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: background,
            border: Border.all(color: AppColors.purple, width: 1),
            borderRadius: BorderRadius.circular(40)
        ),
        child: loading ? const CircularProgressIndicator(color: Colors.white,) : Row(
          spacing: 11,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon),
            SizedBox(
                width: 160,
                child: UbuntuText(text: text,color: AppColors.white, fontSize: fontSize))
          ],
        ),
      ),
    );
  }
}
