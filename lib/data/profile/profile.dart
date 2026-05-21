class Profile {
  final String? bio;
  final String? profileImage;
  final String? wallpaper;
  final String? address;
  final String? gender;
  final String? maritalStatus;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final int? totalLikesCount;
  final int? postsCount;
  final int? followingCount;
  final int? followersCount;

  Profile({
    this.bio,
    this.profileImage,
    this.wallpaper,
    this.address,
    this.gender,
    this.maritalStatus,
    this.phoneNumber,
    this.dateOfBirth,
    this.totalLikesCount,
    this.postsCount,
    this.followingCount,
    this.followersCount,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      bio: json['bio'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
      wallpaper: json['wallpaper'] as String? ?? '',
      address: json['address'] as String? ?? '',
      gender: json['gender'] as String? ?? 'None',
      maritalStatus: json['marital_status'] as String? ?? 'Single',
      phoneNumber: json['phone_number'] as String? ?? '',
      dateOfBirth: json['date_of_birth'] != null
          ? DateTime.tryParse(json['date_of_birth'] as String)
          : null,
      totalLikesCount: json['total_likes_count'] as int? ?? 0,
      postsCount: json['posts_count'] as int? ?? 0,
      followingCount: json['following_count'] as int? ?? 0,
      followersCount: json['followers_count'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'profileImage': profileImage,
      'wallpaper': wallpaper,
      'address': address,
      'gender': gender,
      'marital_status': maritalStatus,
      'phone_number': phoneNumber,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'total_likes_count': totalLikesCount,
      'posts_count': postsCount,
      'following_count': followingCount,
      'followers_count': followersCount,
    };
  }
}