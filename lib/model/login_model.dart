class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      // ignore: prefer_if_null_operators
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String mobile;
  String password;

  LoginRequestModel({
    required this.mobile,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'Mobile': mobile.trim(),
      'Password': password.trim(),
    };
    return map;
  }
}
