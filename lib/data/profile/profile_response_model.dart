
import 'package:posts_app/data/profile/profile.dart';

class ProfileResponseModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final Profile? profile;
  final bool? isFollowing;
  final bool? followsViewer;

  ProfileResponseModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profile,
    this.isFollowing,
    this.followsViewer,
  });

  String get fullName => '$firstName $lastName'.trim();

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      id: json['id'] as int? ?? 0,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      profile: json['profileInfo'] != null
          ? Profile.fromJson(json['profileInfo'] as Map<String, dynamic>)
          : Profile.fromJson(const {}),
      isFollowing: json['is_following'] as bool? ?? false,
      followsViewer: json['follows_viewer'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'profileInfo': profile?.toJson(),
      'is_following': isFollowing,
      'follows_viewer': followsViewer,
    };
  }
}