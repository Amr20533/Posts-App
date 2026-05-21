import 'package:flutter/material.dart';
import 'package:posts_app/data/profile/profile_response_model.dart';

@immutable
abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class ProfileLoading extends ProfileStates {}

class ProfileGetSuccess extends ProfileStates {
  final ProfileResponseModel profile;

  ProfileGetSuccess({required this.profile});
}

class ProfileGetError extends ProfileStates {
  final String message;

  ProfileGetError({required this.message});
}