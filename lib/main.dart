import 'package:flutter/material.dart';
import 'package:posts_app/core/app_routes.dart';
import 'package:posts_app/core/page_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: ThemeData(

      ),
      initialRoute: AppRoutes.splash,
      routes: pageRoutes,
    );
  }
}
