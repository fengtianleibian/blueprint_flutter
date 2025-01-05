import 'package:buleprint_frame/common/models/request/user_register_req.dart';
import 'package:buleprint_frame/common/routers/names.dart';
import 'package:buleprint_frame/common/utils/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  // 表单key
  GlobalKey formKey = GlobalKey<FormState>();

  // 用户名
  TextEditingController userNameController =
      TextEditingController(text: "username");

  // 邮件
  TextEditingController emailController =
      TextEditingController(text: "email@example.com");

  // 姓
  TextEditingController firstNameController =
      TextEditingController(text: "ducafe");

  // 名
  TextEditingController lastNameController = TextEditingController(text: "cat");

  // 密码
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  // 初始化
  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  _initData() {
    update(["register"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onClose() {
    super.onClose();
    // 释放资源
    userNameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
  }

  // 注册
  void onSignUp() {
    if ((formKey.currentState as FormState).validate()) {
      // aes 加密密码
      var password = EncryptUtil().aesEncode(passwordController.text);
      //var password = passwordController.text;

      //带参数 到 注册验证码页面
      Get.offNamed(
        RouteNames.systemRegisterPin,
        arguments: UserRegisterReq(
          username: userNameController.text,
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          password: password,
        ),
      );

      // 验证通过提交数据
      Get.toNamed(RouteNames.systemRegisterPin);
    }
  }

// 登录
  void onSignIn() {}
}
