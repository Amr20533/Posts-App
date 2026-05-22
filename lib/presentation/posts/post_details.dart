import 'package:flutter/material.dart';
import 'package:posts_app/data/posts/post.dart';
import 'package:posts_app/presentation/posts/widgets/post_card.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PostCard(post: post, hasDetails: true,),
    );
  }
}
