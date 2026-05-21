import 'post.dart';

class PostsResponseModel {
  final List<Post> posts;

  PostsResponseModel({required this.posts});

  factory PostsResponseModel.fromJson(Map<String, dynamic> json) {
    return PostsResponseModel(
      posts: json['posts'] != null
          ? (json['posts'] as List)
          .map((postJson) => Post.fromJson(postJson as Map<String, dynamic>))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'posts': posts.map((post) => post.toJson()).toList(),
    };
  }
}