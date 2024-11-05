import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionService {
  final encrypt.Key key = encrypt.Key.fromLength(32);
  final encrypt.IV iv = encrypt.IV.fromLength(16);
  late final encrypt.Encrypter encrypter;

  EncryptionService() {
    encrypter = encrypt.Encrypter(encrypt.AES(key));
  }

  /// Encrypts a plain text and returns the encrypted string.
  String encryptData(String plainText) {
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  /// Decrypts an encrypted string and returns the plain text.
  String decryptData(String encryptedText) {
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}
