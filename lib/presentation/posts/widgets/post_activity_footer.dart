import 'package:flutter/material.dart';
import 'package:posts_app/core/constants/app_assets.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/data/posts/post.dart';


class PostActivityFooter extends StatelessWidget {
  const PostActivityFooter({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {

              },
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.heart,
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    '${post.likesNo}',
                    style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Row(
                children: [
                  Image.asset(AppAssets.comments,color: AppColors.black),
                  const SizedBox(width: 5.0),
                  Text('${post.comments?.length}', style: const TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const SizedBox(width: 30.0),
            InkWell(
              onTap: () {},
              child: Image.asset(AppAssets.share, color: AppColors.black,),
            ),
          ],
        ),
      ),
    );
  }
}