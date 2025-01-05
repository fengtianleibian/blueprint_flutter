import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

/// pin 输入框
class PinPutWidget extends StatelessWidget {
  /// 提交事件
  final Function(String)? onSubmit;

  /// 焦点
  final FocusNode? focusNode;

  /// 文本编辑控制器
  final TextEditingController? controller;

  /// 验证函数
  final String? Function(String?)? validator;

  const PinPutWidget({
    super.key,
    this.onSubmit,
    this.focusNode,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // 默认
    final defaultPinTheme = PinTheme(
      // 宽度
      width: 45,
      // 高度
      height: 45,
      // 文本样式
      textStyle: const TextStyle(
          // 字体大小
          fontSize: 18,
          // 颜色
          // color: AppColors.surfaceVariant,
          // 字体粗细
          fontWeight: FontWeight.w600),
      // 装饰
      decoration: BoxDecoration(
        // 边框
        border: Border.all(color: context.colors.scheme.outlineVariant),
        // 圆角
        borderRadius: BorderRadius.circular(5),
      ),
    );

    // 编辑
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      // 边框
      border: Border.all(color: context.colors.scheme.primary),
      // 圆角
      borderRadius: BorderRadius.circular(5),
    );

    // 完成
    final submittedPinTheme = defaultPinTheme.copyWith(
      // 背景颜色
      decoration: defaultPinTheme.decoration?.copyWith(
        // 背景颜色
        color: context.colors.scheme.surface,
      ),
    );

    return Pinput(
      // 默认
      defaultPinTheme: defaultPinTheme,
      // 聚焦
      focusedPinTheme: focusedPinTheme,
      // 完成
      submittedPinTheme: submittedPinTheme,
      // 长度
      length: 6,
      // 验证函数
      validator: validator,
      // 自动验证
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      // 显示光标
      showCursor: true,
      // 自动焦点
      autofocus: true,
      // 密码显示
      obscureText: true,
      // 键盘外观
      keyboardAppearance: Brightness.light,
      // 焦点
      focusNode: focusNode,
      // 文本控制器
      controller: controller,
      // 提交
      onCompleted: onSubmit,
    );
  }
}
