import 'package:flutter/material.dart';

@immutable
abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final Map<String, dynamic> userData; 

  LoginSuccess({required this.userData});
}

class LoginError extends LoginStates {
  final String message;

  LoginError({required this.message});
}