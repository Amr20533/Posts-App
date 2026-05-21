import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';

class UbuntuText extends StatelessWidget {
  const UbuntuText({super.key, required this.text,
    this.fontSize = 14,
    this.color = AppColors.grey,
    this.fontWeight = FontWeight.w400,
    this.height,
    this.maxLines,
    this.textAlign,

  });
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Ubuntu',
          fontWeight: fontWeight,
          height: height
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}
