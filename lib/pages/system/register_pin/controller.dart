import 'package:buleprint_frame/common/api/user.dart';
import 'package:buleprint_frame/common/i18n/locale_keys.dart';
import 'package:buleprint_frame/common/models/request/user_register_req.dart';
import 'package:buleprint_frame/common/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPinController extends GetxController {
  RegisterPinController();

  // 这里默认一个 pin 值，生产环境在服务端验证
  String pinCheckValue = '111111';

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  _initData() {
    update(["register_pin"]);
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
    pinController.dispose();
  }

  // 注册界面传值
  UserRegisterReq? req = Get.arguments;

  // ping 文字输入控制器
  TextEditingController pinController = TextEditingController();

  // 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  // pin 触发提交
  void onPinSubmit(String val) {
    debugPrint("onPinSubmit: $val");
    // 提交注册
    _register();
  }

  // 按钮提交
  void onBtnSubmit() {
    // 提交注册
    _register();
  }

  // 按钮返回
  void onBtnBackup() {
    Get.back();
  }

  // 验证 pin
  String? pinValidator(val) {
    return val == pinCheckValue
        ? null
        : LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"});
  }

  // 注册
  Future<void> _register() async {
    try {
      Loading.show();

      // 检查 Pin
      if (pinController.text.isEmpty || pinController.text != pinCheckValue) {
        return Loading.error(
            LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"}));
      }

      // 注册提交
      bool isOk = await UserApi.register(req);
      if (isOk) {
        Loading.success(
            LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));
        Get.back(result: true);
      }

      // 提示成功
      Loading.success(
          LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));

      Get.back(result: true);
    } finally {
      Loading.dismiss();
    }
  }
}
