import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/constants/app_routes.dart';
import 'package:posts_app/core/themes/app_themes.dart';
import 'package:posts_app/features/posts/post_cubit.dart';
import 'package:posts_app/core/router/page_routes.dart';
import 'package:posts_app/features/auth/login_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<PostCubit>(
          create: (context) => PostCubit()..getPosts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Posts App',
        theme: AppThemes().lightTheme,
        initialRoute: AppRoutes.splash,
        routes: pageRoutes,
      ),
    );
  }
}
