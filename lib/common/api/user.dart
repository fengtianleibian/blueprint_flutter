import 'package:buleprint_frame/common/models/request/user_register_req.dart';
import 'package:buleprint_frame/common/services/base_http.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await BaseHttpService.to.post(
      '/users/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }
}
