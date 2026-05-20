import 'package:flutter/material.dart';
import 'package:posts_app/core/app_routes.dart';
import 'package:posts_app/presentation/start/splash_screen.dart';
import '../presentation/auth/login_screen.dart';

Map<String, WidgetBuilder> pageRoutes = {
  AppRoutes.splash: (context) => SplashScreen(),
  AppRoutes.login: (context) => LoginScreen(),
};