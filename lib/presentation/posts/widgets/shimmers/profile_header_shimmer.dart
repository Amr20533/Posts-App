import 'package:flutter/material.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileHeaderShimmer extends StatelessWidget {
  const ProfileHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {

    return Skeletonizer(
      enabled: true,
      child: Row(
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
    );
  }
}