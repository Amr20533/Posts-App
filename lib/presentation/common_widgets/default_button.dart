import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/presentation/common_widgets/ubunto_text.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final Color background;
  final Color textColor;
  final VoidCallback pressed;
  final double height;
  final double fontSize;
  final String text;
  final bool isUpperCase;
  final bool loading;

  const DefaultButton({
    super.key,
    this.width = double.infinity,
    this.background = AppColors.black,
    this.textColor = Colors.white,
    required this.pressed,
    this.height = 50.0,
    this.fontSize = 16.0,
    required this.text,
    this.isUpperCase = true,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: background,
          border: Border.all(color: AppColors.black, width: 1),
          borderRadius: BorderRadius.circular(40)
      ),
      child: MaterialButton(
        onPressed: pressed,
        child: loading ? const CircularProgressIndicator(color: Colors.white,) : UbuntuText(text: text,color: AppColors.white, fontSize: fontSize),
      ),
    );
  }
}
