import 'package:flutter/material.dart';
import 'package:posts_app/core/app_routes.dart';
import 'package:posts_app/core/style/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/icons/logo.png'),
            Text("Snaply"),
          ],
        )
      ),
    );
  }
}