class Post {
  final String? id;
  final int? user;
  final String? image;
  final String? caption;
  final int? likesNo;
  final List<dynamic>? likes;
  final List<dynamic>? comments;
  final DateTime? createdAt;
  final bool? isLiked;

  Post({
    this.id,
    this.user,
    this.image,
    this.caption,
    this.likesNo,
    this.likes,
    this.comments,
    this.createdAt,
    this.isLiked,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String?,
      user: json['user'] as int?,
      image: json['image'] as String?,
      caption: json['caption'] as String?,
      likesNo: json['likes_no'] as int?,
      likes: json['likes'] != null ? List<dynamic>.from(json['likes'] as List) : null,
      comments: json['comments'] != null ? List<dynamic>.from(json['comments'] as List) : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      isLiked: json['is_liked'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'image': image,
      'caption': caption,
      'likes_no': likesNo,
      'likes': likes,
      'comments': comments,
      'created_at': createdAt?.toIso8601String(),
      'is_liked': isLiked,
    };
  }
}