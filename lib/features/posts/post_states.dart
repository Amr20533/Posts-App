import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/data/posts/post.dart';

@immutable
abstract class PostStates extends Equatable {
  const PostStates();

  @override
  List<Object?> get props => [];
}

class PostInitial extends PostStates {}

class PostLoading extends PostStates {}

class PostGetSuccess extends PostStates {
  final List<Post> posts;
  final bool isUploading;
  final String? errorMessage;

  const PostGetSuccess({
    required this.posts,
    this.isUploading = false,
    this.errorMessage,
  });

  PostGetSuccess copyWith({
    List<Post>? posts,
    bool? isUploading,
    String? errorMessage,
  }) {
    return PostGetSuccess(
      posts: posts ?? this.posts,
      isUploading: isUploading ?? this.isUploading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [posts, isUploading, errorMessage];
}

class PostGetError extends PostStates {
  final String message;

  const PostGetError({required this.message});
}

class PostUploadLoading extends PostStates {}
class PostUploadSuccess extends PostStates {
  final int? userId;
  const PostUploadSuccess({this.userId});
}

class PostUploadError extends PostStates {
  final String message;

  const PostUploadError({required this.message});
}
