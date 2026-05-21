class LoginResponseModel {
  final String status;
  final String access;
  final String refresh;

  LoginResponseModel({required this.status, required this.access, required this.refresh});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] as String? ?? '',
      access: json['access'] as String? ?? '',
      refresh: json['refresh'] as String? ?? '',
    );
  }
}