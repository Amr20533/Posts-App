import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/constants/app_assets.dart';
import 'package:posts_app/features/posts/post_cubit.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/data/posts/post.dart';
import 'package:posts_app/features/posts/post_states.dart';
import 'package:posts_app/presentation/common_widgets/ubunto_text.dart';
import 'package:posts_app/presentation/posts/widgets/post_card.dart';
import 'package:posts_app/presentation/posts/widgets/type_post_box.dart';
import 'package:posts_app/presentation/common_widgets/circle_action_button.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text(
            "Snaply",
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Black_Han_Sans',
              fontWeight: FontWeight.w500,
              color: AppColors.purple,
            ),
          ),
          actions: [
            CircleActionButton(
              icon: AppAssets.inbox,
              onTap: () {},
            ),
            CircleActionButton(
              icon: AppAssets.notification,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: BlocConsumer<PostCubit, PostStates>(
         listener: (context, state) {
        },
          builder: (context, state){
            if(state is PostGetSuccess){
              List<Post> posts = state.posts;
              return RefreshIndicator(
                onRefresh: ()=> context.read<PostCubit>().getPosts(),
                backgroundColor: AppColors.white,
                color: AppColors.purple,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(child: TypePostBox()),

                    SliverList.separated(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {

                        final Post post = posts[index];

                        return PostCard(post: post);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 28);
                      },
                    ),

                    SliverToBoxAdapter(child: const SizedBox(height: 100)),
                  ],
                ),
              );
        }else{
            return const Center(child: UbuntuText(text: "Something Went Wrong, Please try again latter!"),);
        }
      }

      ),

    );
  }
}
