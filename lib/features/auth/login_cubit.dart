import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/constants/api_constants.dart';
import 'package:posts_app/core/network/api_helper.dart';
import 'package:posts_app/core/services/data_storage.dart';
import 'package:posts_app/features/auth/login_states.dart';
import 'package:posts_app/data/auth/login_model.dart';
import 'package:posts_app/data/auth/login_response_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  final ApiHelper _apiHelper = ApiHelper();

  LoginCubit() : super(LoginInitial());

  Future<void> login(LoginModel loginModel) async {
    if (loginModel.email.isEmpty || loginModel.password.isEmpty) {
      emit(LoginError(message: 'Email and password cannot be empty!!'));
      return;
    }

    emit(LoginLoading());

    try {
      final response = await _apiHelper.postData(
        ApiConstants.login,
        loginModel.toJson(),
        requiresAuth: false,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {

        final loginResponse = LoginResponseModel.fromJson(response.data);

        final String token = loginResponse.access;

        if (token.isEmpty) {
          emit(LoginError(message: 'Server did not return an access token.'));
          return;
        }
        await DataStorage.instance.writeData(
          DataStorage.keyAuthToken,
          token,
        );


        emit(LoginSuccess(userData: response.data));
      } else {
        emit(LoginError(message: 'Failed to login. Please try again!'));
      }
    } catch (error) {
      emit(LoginError(message: error.toString()));
    }
  }

}