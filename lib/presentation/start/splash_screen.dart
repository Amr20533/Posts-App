import 'package:flutter/material.dart';
import 'package:posts_app/core/constants/app_routes.dart';
import 'package:posts_app/core/services/data_storage.dart';
import 'package:posts_app/core/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _checkAuthentication(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    final String? token = await DataStorage.instance.readData(
      DataStorage.keyAuthToken,
    );

    if (!context.mounted) return;

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAuthentication(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset('assets/icons/logo.png'),
      ),
    );
  }
}