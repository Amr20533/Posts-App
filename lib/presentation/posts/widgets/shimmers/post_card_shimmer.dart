import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostCardShimmer extends StatelessWidget{
  const PostCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {

    return Skeletonizer(
      enabled: true,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: AppColors.white,
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
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.kDividerColor,
                      // color: AppColors.kDividerColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: 120,
                          height: 20,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 80,
                          height: 14,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 120,
                height: 20,
                color: Colors.white,
              ),
              Container(
                width: 120,
                height: 20,
                color: Colors.white,
              ),
              Container(
                width: 120,
                height: 20,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5.0),
                          Container(
                            width: 35,
                            height: 14,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5.0),
                          Container(
                            width: 35,
                            height: 14,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(width: 30.0),
                      Container(
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



