/// 错误体信息
class ErrorMessageModel {
  // 状态码
  int? statusCode;
  // 错误
  String? error;
  // 消息
  String? message;

  ErrorMessageModel({
    this.statusCode,
    this.error,
    this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['statusCode'] as int?,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'error': error,
        'message': message,
      };
}
