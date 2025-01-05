import 'package:encrypt/encrypt.dart';

import '../index.dart';

///  提供 AES 加密功能的工具类，采用单例模式
class EncryptUtil {
  // 单例实例

  static final EncryptUtil _instance = EncryptUtil._internal();
  // 工厂构造方法，返回单例实例

  factory EncryptUtil() => _instance;

  // 私有构造方法，初始化加密器
  EncryptUtil._internal() {
    // 初始化 AES 加密器，使用 CBC 模式和 PKCS7 填充
    encrypter = Encrypter(AES(
      key, // 加密密钥
      mode: AESMode.cbc, // 加密模式：CBC
      padding: 'PKCS7', // 填充方式：PKCS7
    ));
  }

  // AES 加密密钥，通过 Constants 配置文件获取
  final key = Key.fromUtf8(Constants.aesKey);
  // 初始化向量 (IV)，通过 Constants 配置文件获取
  final iv = IV.fromUtf8(Constants.aesIV);
  late Encrypter encrypter;

  /// aes加密
  String aesEncode(String content) {
    // 加密输入内容，使用密钥和初始化向量
    final encrypted = encrypter.encrypt(content, iv: iv);
    // 返回加密后的 Base64 字符串
    return encrypted.base64;
  }
}
