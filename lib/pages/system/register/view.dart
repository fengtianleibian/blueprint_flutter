import 'package:buleprint_frame/common/components/page_title.dart';
import 'package:buleprint_frame/common/i18n/locale_keys.dart';
import 'package:buleprint_frame/common/style/space.dart';
import 'package:buleprint_frame/common/utils/validators.dart';
import 'package:buleprint_frame/common/widgets/button.dart';
import 'package:buleprint_frame/common/widgets/form/input.dart';
import 'package:buleprint_frame/common/widgets/text.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 内容页
    Widget buildView(BuildContext context) {
      return SingleChildScrollView(
        child: <Widget>[
          // 头部标题
          PageTitleWidget(
            title: LocaleKeys.registerTitle.tr,
            desc: LocaleKeys.registerDesc.tr,
          ).paddingTop(35.w),

          // 表单
          _buildForm().card(
            color: context.colors.scheme.surface,
            margin: EdgeInsets.zero,
          ),
        ]
            .toColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .padding(
              bottom: AppSpace.page * 5,
            ),
      );
    }

    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("register")),
          body: SafeArea(
            child: buildView(context),
          ),
        );
      },
    );
  }

  // 表单页
  Widget _buildForm() {
    return Form(
      // 设置globalKey，用于后面获取FormState
      key: controller.formKey,
      // 自动验证
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // 用户名
        InputFormFieldWidget(
          // 自动聚焦
          autofocus: true,
          // 控制器
          controller: controller.userNameController,
          // 标签
          labelText: LocaleKeys.registerFormName.tr,
          // 前缀
          prefix: const Icon(Icons.person),
          // 后缀
          suffix: const Icon(Icons.done),
          // 验证器
          validator: Validatorless.multiple([
            // 必填
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            // 最小长度
            Validatorless.min(
                3, LocaleKeys.validatorMin.trParams({"size": "3"})),
            // 最大长度
            Validatorless.max(
                20, LocaleKeys.validatorMax.trParams({"size": "20"})),
          ]),
        ).paddingBottom(AppSpace.listRow.w),

        // email
        InputFormFieldWidget(
          // 控制器
          controller: controller.emailController,
          // 标签
          labelText: LocaleKeys.registerFormEmail.tr,
          // 键盘类型
          keyboardType: TextInputType.emailAddress,
          // 前缀
          prefix: const Icon(Icons.email),
          // 后缀
          suffix: const Icon(Icons.done),
          // 验证器
          validator: Validatorless.multiple([
            // 必填
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            // 邮箱
            Validatorless.email(LocaleKeys.validatorEmail.tr),
          ]),
        ).paddingBottom(AppSpace.listRow.w),

        // first name
        InputFormFieldWidget(
          // 控制器
          controller: controller.firstNameController,
          // 标签
          labelText: LocaleKeys.registerFormFirstName.tr,
          // 前缀
          prefix: const Icon(Icons.person),
          // 后缀
          suffix: const Icon(Icons.done),
          // 验证器
          validator: Validatorless.multiple([
            // 必填
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            // 最小长度
            Validatorless.min(
                3, LocaleKeys.validatorMin.trParams({"size": "3"})),
            // 最大长度
            Validatorless.max(
                20, LocaleKeys.validatorMax.trParams({"size": "20"})),
          ]),
        ).paddingBottom(AppSpace.listRow.w),

        // last name
        InputFormFieldWidget(
          // 控制器
          controller: controller.lastNameController,
          // 标签
          labelText: LocaleKeys.registerFormLastName.tr,
          // 前缀
          prefix: const Icon(Icons.person),
          // 后缀
          suffix: const Icon(Icons.done),
          // 验证器
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.min(
                3, LocaleKeys.validatorMin.trParams({"size": "3"})),
            Validatorless.max(
                20, LocaleKeys.validatorMax.trParams({"size": "20"})),
          ]),
        ).paddingBottom(AppSpace.listRow.w),

        // password
        InputFormFieldWidget(
          // 控制器
          controller: controller.passwordController,
          // 标签
          labelText: LocaleKeys.registerFormPassword.tr,
          // 前缀
          prefix: const Icon(Icons.password),
          // 是否隐藏
          obscureText: true,
          // 后缀
          suffix: const Icon(Icons.done),
          // 验证器
          validator: Validatorless.multiple([
            // 必填
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            // 密码
            Validators.password(
              8,
              18,
              LocaleKeys.validatorPassword.trParams(
                {"min": "8", "max": "18"},
              ),
            ),
          ]),
        ).paddingBottom(AppSpace.listRow.w * 2),

        // 注册按钮
        _buildBtnSignUp(),

        // 提示文字
        _buildTips(),

        //
      ].toColumn().paddingVertical(10),
    ).paddingAll(AppSpace.card);
  }

  // 按钮
  Widget _buildBtnSignUp() {
    return ButtonWidget.primary(
      LocaleKeys.loginSignUp.tr,
      onTap: controller.onSignUp,
    ).width(double.infinity).paddingBottom(AppSpace.listRow);
  }

  // 提示
  Widget _buildTips() {
    return <Widget>[
      // 提示
      TextWidget.h4(LocaleKeys.registerHaveAccount.tr),

      // 登录文字按钮
      ButtonWidget.ghost(
        LocaleKeys.loginSignIn.tr,
        onTap: controller.onSignIn,
      )
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
