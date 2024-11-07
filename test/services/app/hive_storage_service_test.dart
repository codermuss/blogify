import 'dart:convert';

import 'package:blogify/app/app.locator.dart';
import 'package:blogify/services/app/encryption_service.dart';
import 'package:blogify/services/app/hive_storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';

class FakePathProviderPlatform extends Fake with MockPlatformInterfaceMixin implements PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    return 'test/services/app/hive_folder';
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return 'test/services/app/hive_folder';
  }
}

void main() {
  group(
    'HiveStorageServiceTest -',
    () {
      late HiveStorageService storageService;
      late MockEncryptionService mockEncryptionService;

      setUp(() async {
        registerServices();
        mockEncryptionService = locator<EncryptionService>() as MockEncryptionService;
        PathProviderPlatform.instance = FakePathProviderPlatform();
        storageService = HiveStorageService();
        await storageService.init();
      });

      tearDown(() {
        locator.reset();
      });

      test('saveData should encrypt and store the data', () async {
        const key = 'testKey';
        final value = {'data': 'testValue'};
        const encryptedKey = 'encryptedKey';
        const encryptedData = 'encryptedData';

        when(mockEncryptionService.encrypt(key)).thenReturn(encryptedKey);
        when(mockEncryptionService.encrypt(json.encode(value))).thenReturn(encryptedData);

        await storageService.saveData(key, value);
      });

      test('getData should retrieve and decrypt the data', () {
        const key = 'testKey';
        const encryptedKey = 'encryptedKey';
        const encryptedData = 'encryptedData';
        final value = {'data': 'testValue'};
        final jsonData = json.encode(value);

        when(mockEncryptionService.encrypt(key)).thenReturn(encryptedKey);
        when(mockEncryptionService.decrypt(encryptedData)).thenReturn(jsonData);

        final result = storageService.getData<Map<String, dynamic>>(key);

        expect(result, equals(value));
      });

      test('deleteData should remove the entry with the encrypted key', () async {
        const key = 'testKey';
        const encryptedKey = 'encryptedKey';

        when(mockEncryptionService.encrypt(key)).thenReturn(encryptedKey);

        await storageService.deleteData(key);
      });

      test('clearAllData should clear the box', () async {
        await storageService.clearAllData();
      });
    },
  );
}
