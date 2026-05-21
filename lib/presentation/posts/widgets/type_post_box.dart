import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/posts/post_cubit.dart';
import 'package:posts_app/core/themes/app_colors.dart';
import 'package:posts_app/data/posts/post.dart';
import 'package:posts_app/data/posts/upload_post_model.dart';
import 'package:posts_app/features/posts/post_states.dart';
import 'package:posts_app/presentation/common_widgets/ubunto_text.dart';

class TypePostBox extends StatefulWidget {
  const TypePostBox({super.key});

  @override
  State<TypePostBox> createState() => _TypePostBoxState();
}

class _TypePostBoxState extends State<TypePostBox> {

  bool _isUploading = false;
  final TextEditingController _captionController = TextEditingController();
  final ValueNotifier<bool> _isPostButtonEnabled = ValueNotifier<bool>(false);

  void _checkInputValidity() {
    _isPostButtonEnabled.value = _captionController.text.trim().isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    _captionController.addListener(_checkInputValidity);
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 28),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              offset: Offset(0, 4),
              blurRadius: 20,
            )
          ],
        ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text Input field
                      TextField(
                        controller: _captionController,
                        decoration: const InputDecoration(
                          hintText: 'What is happening?',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'Ubuntu',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                        cursorColor: AppColors.purple,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: null,
                        textCapitalization: TextCapitalization.sentences,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Ubuntu',
                        ),
                      ),

                      const SizedBox(height: 12),

                      BlocConsumer<PostCubit, PostStates>(
                        listener: (context, state) {
                          if (state is PostGetSuccess) {
                            _isUploading = false;
                            _captionController.clear();
                          }

                          if (state is PostGetSuccess && state.isUploading) {
                            _isUploading = true;
                          }
                        },
                        builder: (context, state) {
                          if (state is PostGetSuccess) {
                            _isUploading = state.isUploading;
                          }

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.tag_faces,
                                color: AppColors.purple,
                                size: 22,
                              ),


                              ValueListenableBuilder<bool>(
                                valueListenable: _isPostButtonEnabled,
                                builder: (context, isEnabled, child) {
                                  final bool canSubmit = isEnabled && !_isUploading;

                                  return ElevatedButton(
                                    onPressed: canSubmit
                                        ? () {
                                      UploadPostModel uploadPostModel = UploadPostModel(
                                        caption: _captionController.text.trim(),
                                      );
                                      context.read<PostCubit>().uploadPost(uploadPostModel);
                                    }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.purple,
                                      disabledBackgroundColor: AppColors.purple.withValues(alpha: 0.4),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: !_isUploading
                                        ? const UbuntuText(
                                          text: 'Post',
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                        ) : const SizedBox(
                                          width: 14,
                                          height: 14,
                                          child: CircularProgressIndicator(
                                            color: AppColors.white,
                                            strokeWidth: 2,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}