
class UploadPostModel {
  final String? caption;

  UploadPostModel({
    this.caption,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (caption != null && caption!.trim().isNotEmpty) {
      data['caption'] = caption!.trim();
    }
    return data;
  }
}