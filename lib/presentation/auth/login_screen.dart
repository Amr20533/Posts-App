import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/constants/app_assets.dart';
import 'package:posts_app/core/constants/app_routes.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/core/utils/reg_exp.dart';
import 'package:posts_app/features/auth/login_cubit.dart';
import 'package:posts_app/features/auth/login_states.dart';
import 'package:posts_app/data/auth/login_model.dart';
import 'package:posts_app/presentation/common_widgets/default_button.dart';
import 'package:posts_app/presentation/common_widgets/default_error_snackbar.dart';
import 'package:posts_app/presentation/common_widgets/default_social_auth_button.dart';
import 'package:posts_app/presentation/common_widgets/default_text_form.dart';
import 'package:posts_app/presentation/common_widgets/ubunto_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),

        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocConsumer<LoginCubit, LoginStates>(

                  listener: (context, state) {
                    if (state is LoginLoading) {
                      _isLoading = true;
                    }

                    if (state is LoginSuccess) {
                      _isLoading = false;
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    }

                    if (state is LoginError) {
                      _isLoading = false;
                      defaultErrorSnackBar(context, state.message);
                    }
                  },
                  builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(height: 40.0),

                      UbuntuText(
                        text: "Log in",
                        color: AppColors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 30.0),

                      DefaultSocialAuthButton(
                        pressed: () {},
                        text: 'Log In with Google',
                        icon: AppAssets.google,
                      ),
                      const SizedBox(height: 12.0),
                      DefaultSocialAuthButton(
                        pressed: () {},
                        text: 'Log In with Facebook',
                        icon: AppAssets.facebook,
                      ),
                      const SizedBox(height: 12.0),
                      DefaultSocialAuthButton(
                        pressed: () {},
                        text: 'Log In with Twitter',
                        icon: AppAssets.twitter2,
                      ),
                      const SizedBox(height: 38.0),

                      Row(
                        spacing: 16,
                        children: [
                          Expanded(child: Divider(color: AppColors.lightGrey, height: 1)),
                          UbuntuText(
                            text: "Or Log In with Email",
                            color: AppColors.lightBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          Expanded(child: Divider(color: AppColors.lightGrey, height: 1)),
                        ],
                      ),
                      const SizedBox(height: 28.0),

                      DefaultTextForm(
                        controller: _emailController,
                        title: 'Email',
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        label: 'Enter your email',
                        prefix: Icons.email_outlined,
                      ),
                      const SizedBox(height: 16.0),

                      DefaultTextForm(
                        controller: _passwordController,
                        title: 'Password',
                        type: TextInputType.visiblePassword,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility_sharp,
                            color: !_obscurePassword
                                ? AppColors.black
                                : AppColors.lightGrey,
                          ),
                        ),
                        onSubmit: (value) {},
                        isPassword: _obscurePassword,
                        validate: (String? value) {
                          if (value!.isEmpty) return 'required';
                          return null;
                        },
                        label: 'Enter your password',
                        prefix: Icons.lock_outline,
                      ),
                      const SizedBox(height: 16.0),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: UbuntuText(text: "Forgot password?", color: AppColors.black,),
                      ),
                      const SizedBox(height: 25.0),

                      DefaultButton(
                        pressed: () {
                          _validateData(context);
                        },
                        loading: _isLoading,
                        text: 'Log In',
                      ),
                      const SizedBox(height: 16.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 6,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.signup);
                            },
                            child: Text(
                              'Register',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validateData(BuildContext context) {

    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      final loginModel = LoginModel(
        email: _emailController.text,
        password: _passwordController.text,
      );

      context.read<LoginCubit>().login(loginModel);

    } else if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email address and Password are required!'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.lightBlack,
        ),
      );
    }
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}