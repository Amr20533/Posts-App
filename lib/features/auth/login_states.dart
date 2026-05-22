import 'package:flutter/material.dart';
import 'package:posts_app/data/auth/login_response_model.dart';

@immutable
abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final LoginResponseModel userData;

  LoginSuccess({required this.userData});
}

class LoginError extends LoginStates {
  final String message;

  LoginError({required this.message});
}