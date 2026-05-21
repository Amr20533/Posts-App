import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/presentation/common_widgets/ubunto_text.dart';

class DefaultTextForm extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final double height;
  final Function? onSubmit;
  final bool isPassword;
  final String? Function(String?)? validate;
  final IconData prefix;
  final String label;
  final String title;
  final VoidCallback? redEye;
  final Widget? suffix;
  final VoidCallback? onTap;

  const DefaultTextForm({
    super.key,
    required this.controller,
    required this.type,
    required this.title,
    this.height = 50.0,
    this.onSubmit,
    this.isPassword = false,
    required this.validate,
    required this.prefix,
    required this.label,
    this.redEye,
    this.suffix,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UbuntuText(text: title, color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w500,),
        SizedBox(
          height: height,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w400, fontFamily: 'Ubuntu', fontSize: 14),
              border: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.kDividerColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: AppColors.lightGrey),
                  borderRadius: BorderRadius.circular(40)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: AppColors.softPurple),
                  borderRadius: BorderRadius.circular(40)
              ),
              suffixIcon: suffix,
            ),
            keyboardType: type,
            onTap: onTap,
            obscureText: isPassword,
            validator: validate,
            onFieldSubmitted: (value) => onSubmit?.call(value),
          ),
        ),
      ],
    );
  }
}
