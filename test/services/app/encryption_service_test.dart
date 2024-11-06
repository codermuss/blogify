import 'package:blogify/app/app.locator.dart';
import 'package:blogify/services/app/encryption_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group(
    'EncryptionServiceTest -',
    () {
      setUp(() => registerServices());
      tearDown(() => locator.reset());
      test(
        'should return encrypted string for given plain text',
        () {
          final EncryptionService encryptionService = getAndRegisterEncryptionService();
          const String plainText = 'plainText';
          const String encryptedText = 'encryptedText';
          when(encryptionService.encrypt(plainText)).thenReturn(encryptedText);
          expect(encryptionService.encrypt(plainText), encryptedText);
        },
      );

      test(
        'should return decrypted string for given encrypted text',
        () {
          final EncryptionService encryptionService = getAndRegisterEncryptionService();
          const String encryptedText = 'encryptedText';
          const String plainText = 'plainText';
          when(encryptionService.decrypt(encryptedText)).thenReturn(plainText);
          expect(encryptionService.decrypt(encryptedText), plainText);
        },
      );

      test(
        'should return plain text for given encrypted text',
        () {
          final EncryptionService encryptionService = getAndRegisterEncryptionService();
          const String encryptedText = 'encryptedText';
          const String plainText = 'plainText';
          when(encryptionService.decrypt(encryptedText)).thenReturn(plainText);
          expect(encryptionService.decrypt(encryptedText), plainText);
        },
      );

      test(
        'should return encrypted text for given plain text',
        () {
          final EncryptionService encryptionService = getAndRegisterEncryptionService();
          const String plainText = 'plainText';
          const String encryptedText = 'encryptedText';
          when(encryptionService.encrypt(plainText)).thenReturn(encryptedText);
          expect(encryptionService.encrypt(plainText), encryptedText);
        },
      );
    },
  );
}
