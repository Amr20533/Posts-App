import 'package:flutter/material.dart';
import 'package:posts_app/core/constants/app_assets.dart';
import 'package:posts_app/core/constants/app_routes.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/data/posts/post.dart';
import 'package:posts_app/presentation/posts/widgets/post_activity_footer.dart';
import 'package:posts_app/presentation/posts/widgets/post_user_info_header.dart';
import 'package:posts_app/presentation/common_widgets/ubunto_text.dart';

class PostCard extends StatelessWidget{
  const PostCard({super.key, required this.post, this.hasDetails = false});
  final Post post;
  final bool hasDetails;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          AppRoutes.postDetails,
          arguments: post,
        );
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
              hasDetails ? Divider(color: AppColors.kDividerColor,) : SizedBox.shrink(),
              hasDetails ? Center(child: Column(
                children: [
                  Image.asset(AppAssets.comments, color: AppColors.lightBlack.withValues(alpha: 0.6), width: 30,height: 30,fit: BoxFit.cover,),
                  UbuntuText(text: "No Comments yet.")
                ],
              ),) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}



