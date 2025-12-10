import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter/services.dart" show rootBundle;
import "package:encrypt/encrypt.dart";
import "package:credit_wise_flutter/app/utils/secrets.dart";

class ConfigService {
  late Map<String, dynamic> _config;

  String get apiBaseUrl => _config["apiBaseUrl"];

  Future<void> loadConfig() async {
    final encryptedBase64 =
        await rootBundle.loadString("config/app_config_enc.txt");

    final encrypter = Encrypter(AES(secretKey, mode: AESMode.cbc));

    final encrypted = Encrypted.fromBase64(encryptedBase64.trim());

    final decryptedJsonString = encrypter.decrypt(encrypted, iv: secretIV);

    _config = json.decode(decryptedJsonString);

    debugPrint("Configuration successfully decrypted and loaded.");
  }
}
