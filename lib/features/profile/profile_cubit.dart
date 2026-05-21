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

      final response = await _apiHelper.getById(
        ApiConstants.getUserInfo,id
      );

      if (response.statusCode == 200) {

        final profileResponseModel = ProfileResponseModel.fromJson(response.data);

        await CacheHelper.saveProfileInfoToCache(profileResponseModel);
        emit(ProfileGetSuccess(profile: profileResponseModel));
      } else {
        emit(ProfileGetError(message: 'Failed to Get User Data. Please try again!'));
      }
    } catch (error) {
      _loadOfflineProfileFallback(error.toString());
      emit(ProfileGetError(message: error.toString()));
    }
  }

  Future<void> _loadOfflineProfileFallback(String originalError) async {
    final ProfileResponseModel? cachedProfile = await CacheHelper.getProfileInfoFromCache();
    if (cachedProfile != null) {
      emit(ProfileGetSuccess(profile: cachedProfile));
    } else {
      emit(ProfileGetError(message: originalError));
    }
  }
}