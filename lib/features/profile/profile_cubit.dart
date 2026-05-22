import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/data/profile/profile_response_model.dart';
import 'package:posts_app/features/profile/profile_states.dart';
import 'package:posts_app/core/services/cache_helper.dart';
import 'package:posts_app/core/constants/api_constants.dart';
import 'package:posts_app/core/network/api_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ApiHelper _apiHelper = ApiHelper();

  ProfileCubit() : super(ProfileInitial());

  Future<void> getUserInfo(String id) async {
    emit(ProfileLoading());

    try {
      final response = await _apiHelper.getById(ApiConstants.getUserInfo, id);

      if (response.statusCode == 200) {
        final profileResponseModel = ProfileResponseModel.fromJson(response.data);
        await CacheHelper.saveProfileInfoToCache(profileResponseModel, id);
        emit(ProfileGetSuccess(profile: profileResponseModel));
      } else {
        final cacheLoadedData = await _loadOfflineProfileFallback(id);
        if (!cacheLoadedData) {
          emit(ProfileGetError(message: 'Failed to Get User Data. Please try again!'));
        }
      }
    } catch (error) {
      final cacheLoadedData = await _loadOfflineProfileFallback(id);
      // if (!cacheLoadedData) {
      //   emit(ProfileGetError(message: error.toString()));
      // }
    }
  }

  Future<bool> _loadOfflineProfileFallback(String id) async {
    try {
      final ProfileResponseModel? cachedProfile = await CacheHelper.getProfileInfoFromCache(id);
      if (cachedProfile != null) {
        emit(ProfileGetSuccess(profile: cachedProfile));
        return true;
      }
    } catch (_) {
      debugPrint("Error while Getting offline User profile data!!");
      // emit(ProfileGetError(message: "Error while Getting offline User profile data!!"));
    }
    return false;
  }
}