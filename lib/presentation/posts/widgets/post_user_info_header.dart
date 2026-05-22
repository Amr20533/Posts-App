import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/data/profile/profile_response_model.dart';
import 'package:posts_app/features/posts/post_cubit.dart';
import 'package:posts_app/features/posts/post_states.dart';
import 'package:posts_app/features/profile/profile_cubit.dart';
import 'package:posts_app/features/profile/profile_states.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/data/posts/post.dart';
import 'package:posts_app/core/constants/api_constants.dart';
import 'package:posts_app/core/utils/format_helper.dart';
import 'package:posts_app/presentation/common_widgets/custom_cached_network_image.dart';
import 'package:posts_app/presentation/common_widgets/ubunto_text.dart';
import 'package:posts_app/presentation/posts/widgets/shimmers/profile_header_shimmer.dart';

class PostUserInfoHeader extends StatelessWidget {
  const PostUserInfoHeader({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserInfo(post.user.toString()),
      child: Builder(
        builder: (profileContext) {

          return BlocListener<PostCubit, PostStates>(
            listener: (context, postState) {
              if (postState is PostUploadSuccess) {
                profileContext.read<ProfileCubit>().getUserInfo(post.user.toString());
              }
            },
            child: BlocConsumer<ProfileCubit, ProfileStates>(
              listener: (context, state) {
                if (state is ProfileGetError) {
                  debugPrint("something went wrong with profile ${state.message}");
                }
              },
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const ProfileHeaderShimmer();
                }

                if (state is ProfileGetSuccess) {
                  ProfileResponseModel? userInfo = state.profile;
                  final profileImageUrl = userInfo.profile?.profileImage;

                  final String imageUrl = (profileImageUrl != null && profileImageUrl.isNotEmpty)
                      ? '${ApiConstants.server}$profileImageUrl'
                      : 'assets/images/default_profile.jpg';

                  return Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: CustomCachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                UbuntuText(
                                    text: '${userInfo.firstName ?? 'User'} ${userInfo.lastName ?? 'Name'}',
                                    height: 1.3,
                                    color: AppColors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    maxLines: 1
                                ),
                                Icon(Icons.more_horiz_sharp, color: AppColors.black, size: 24)
                              ],
                            ),
                            UbuntuText(
                              text: FormatHelper.getFormattedDate(post.createdAt ?? DateTime.now()),
                              height: 1.3,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return const Center(
                  child: UbuntuText(text: "Something Went Wrong, Please try again later!"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}