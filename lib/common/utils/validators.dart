import 'package:flutter/material.dart';

/// 表单验证
class Validators {
  /// 密码必须包含 6 到 20 位数字

  static FormFieldValidator<String> password(int min, int max, String m) =>
      (v) {
        if (v?.isEmpty ?? true) return null;
        if ((v?.length ?? 0) < min) return m;
        if ((v?.length ?? 0) > max) return m;
        return null;
      };
}
