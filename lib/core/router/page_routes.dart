import 'package:flutter/material.dart';
import 'package:posts_app/core/constants/app_routes.dart';
import 'package:posts_app/data/posts/post.dart';
import 'package:posts_app/presentation/posts/post_details.dart';
import 'package:posts_app/presentation/posts/posts_screen.dart';
import 'package:posts_app/presentation/start/splash_screen.dart';
import '../../presentation/auth/login_screen.dart';

Map<String, WidgetBuilder> pageRoutes = {
  AppRoutes.splash: (context) => SplashScreen(),
  AppRoutes.login: (context) => LoginScreen(),
  AppRoutes.home: (context) => PostsScreen(),
  AppRoutes.postDetails: (context) {
    final post = ModalRoute.of(context)!.settings.arguments as Post;
    return PostDetails(post: post);
  },};