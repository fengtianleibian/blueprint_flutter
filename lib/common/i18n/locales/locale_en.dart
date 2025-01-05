import '../locale_keys.dart';

/// 多语言 英文
Map<String, String> localeEn = {
  // 通用
  LocaleKeys.commonSearchInput: 'Enter keyword', //输入关键字
  LocaleKeys.commonBottomSave: 'Save', //保存
  LocaleKeys.commonBottomRemove: 'Remove', //删除
  LocaleKeys.commonBottomCancel: 'Cancel', //取消
  LocaleKeys.commonBottomConfirm: 'Confirm', //确认
  LocaleKeys.commonBottomApply: 'Apply', //应用
  LocaleKeys.commonBottomBack: 'Back', //返回
  LocaleKeys.commonSelectTips: 'Please select', //请选择
  LocaleKeys.commonMessageSuccess: '@method successfully', // 成功消息，动态替换 @method
  LocaleKeys.commonMessageIncorrect: '@method incorrect', // 错误消息，动态替换 @method

  // 样式
  LocaleKeys.stylesTitle: 'Sytles && Function',

  // welcome 欢迎
  LocaleKeys.welcomeOneTitle: 'Choose Your Desire Product',
  LocaleKeys.welcomeOneDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeTwoTitle: 'Complete your shopping',
  LocaleKeys.welcomeTwoDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeThreeTitle: 'Get product at your door',
  LocaleKeys.welcomeThreeDesc:
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
  LocaleKeys.welcomeSkip: 'Skip',
  LocaleKeys.welcomeNext: 'Next',
  LocaleKeys.welcomeStart: 'Get Started',

  // 登录、注册 - 通用
  LocaleKeys.loginForgotPassword: 'Forgot Password?',
  LocaleKeys.loginSignIn: 'Sign In',
  LocaleKeys.loginSignUp: 'Sign Up',
  LocaleKeys.loginOrText: '- OR -',

  // 注册 - new user
  LocaleKeys.registerTitle: 'Register',
  LocaleKeys.registerDesc: 'Sign up to continue',
  LocaleKeys.registerFormName: 'User Name',
  LocaleKeys.registerFormEmail: 'Email',
  LocaleKeys.registerFormPhoneNumber: 'Phone number',
  LocaleKeys.registerFormPassword: 'Password',
  LocaleKeys.registerFormFirstName: 'First name',
  LocaleKeys.registerFormLastName: 'Last name',
  LocaleKeys.registerHaveAccount: 'Already have an account?',

  // 验证提示
  LocaleKeys.validatorRequired: 'The field is obligatory',
  LocaleKeys.validatorEmail: 'The field must be an email',
  LocaleKeys.validatorMin: 'Length cannot be less than @size',
  LocaleKeys.validatorMax: 'Length cannot be greater than @size',
  LocaleKeys.validatorPassword:
      'password must have between @min and @max digits',

  // 注册PIN - register pin
  LocaleKeys.registerPinTitle: 'Verification',
  LocaleKeys.registerPinDesc: 'we will send you a Pin to continue your account',
  LocaleKeys.registerPinFormTip: 'Pin',
  LocaleKeys.registerPinButton: 'Submit',
};
