import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/data/posts/post.dart';
import 'package:posts_app/presentation/posts/widgets/post_activity_footer.dart';
import 'package:posts_app/presentation/posts/widgets/post_user_info_header.dart';
import 'package:posts_app/presentation/common_widgets/ubunto_text.dart';

class PostCard extends StatelessWidget{
  const PostCard({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(
                color:AppColors.shadow,
                offset: Offset(0, 4),
                blurRadius: 20
            )]
        ),
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 18.0,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 18,
            children: <Widget>[
              PostUserInfoHeader(post: post),
              UbuntuText(text: '${post.caption}', color: AppColors.grey,maxLines: 30),
              PostActivityFooter(post: post),
            ],
          ),
        ),
      ),
    );
  }
}



