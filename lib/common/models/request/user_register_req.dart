/// 用户注册请求
class UserRegisterReq {
  // 用户名
  String? username;
  // 密码
  String? password;
  // 邮箱
  String? email;
  // 姓
  String? firstName;
  // 名
  String? lastName;

  UserRegisterReq({
    this.username,
    this.password,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory UserRegisterReq.fromJson(Map<String, dynamic> json) {
    return UserRegisterReq(
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
      };
}
