import 'package:encrypt/encrypt.dart';

class EncryptionService {
  final Key _key = Key.fromLength(32);
  final IV _iv = IV.fromLength(16);

  String encrypt(String data) {
    final Encrypter encrypter = Encrypter(AES(_key));
    final Encrypted encryptedData = encrypter.encrypt(data, iv: _iv);
    return encryptedData.base64;
  }

  // Şifreyi çözen metod
  String decrypt(String encryptedData) {
    final Encrypter encrypter = Encrypter(AES(_key));
    final String decryptedData = encrypter.decrypt64(encryptedData, iv: _iv);
    return decryptedData;
  }
}
