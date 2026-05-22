import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/services/cache_helper.dart';
import 'package:posts_app/data/posts/post.dart';
import 'package:posts_app/data/posts/posts_response_model.dart';
import 'package:posts_app/data/posts/upload_post_model.dart';
import 'package:posts_app/core/constants/api_constants.dart';
import 'package:posts_app/core/network/api_helper.dart';
import 'package:posts_app/features/posts/post_states.dart';

class PostCubit extends Cubit<PostStates> {
  final ApiHelper _apiHelper = ApiHelper();

  PostCubit() : super(PostInitial());
  Future<void> getPosts() async {
    final currentState = state;

    if (currentState is PostGetSuccess) {
    } else {
      emit(PostLoading());
    }

    try {
      final response = await _apiHelper.getData(ApiConstants.getAllPosts);

      if (response.statusCode == 200) {
        final postsResponseModel = PostsResponseModel.fromJson(response.data);
        final List<Post> freshPosts = postsResponseModel.posts ?? [];

        await CacheHelper.savePostsToCache(freshPosts);
        emit(PostGetSuccess(
          posts: freshPosts,
          isUploading: false,
        ));
      } else {
        emit(PostGetError(message: 'Failed to fetch posts.'));
      }
    } catch (error) {
      await _loadOfflineFallback(error.toString());
    }
  }

  Future<void> uploadPost(UploadPostModel uploadPostModel) async {
    final currentState = state;

    if (currentState is PostGetSuccess) {
      emit(currentState.copyWith(isUploading: true));
    }

    try {
      final response = await _apiHelper.postMultipartData(
        ApiConstants.uploadPost,
        uploadPostModel.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final singleResponse = Post.fromJson(response.data);

        if (singleResponse.id != null) {
          getPosts();
          emit(PostUploadSuccess());
          } else {
          getPosts();
          }
      } else {
        _handleUploadError(currentState, 'Failed to Upload Post.');
      }
    } catch (error) {
      _handleUploadError(currentState, error.toString());
    }
  }

  void _handleUploadError(PostStates currentState, String errorMsg) {
    if (currentState is PostGetSuccess) {
      emit(currentState.copyWith(isUploading: false, errorMessage: errorMsg));
    } else {
      emit(PostUploadError(message: errorMsg));
    }
  }

  Future<void> _loadOfflineFallback(String originalError) async {
    final List<Post> cachedPosts = await CacheHelper.getPostsFromCache();

    if (cachedPosts.isNotEmpty) {
      emit(PostGetSuccess(
        posts: cachedPosts,
        isUploading: false,
        errorMessage: 'You are currently offline. We\'re Showing cached posts.',
      ));
    } else {
      emit(PostGetError(message: originalError));
    }
  }
}
