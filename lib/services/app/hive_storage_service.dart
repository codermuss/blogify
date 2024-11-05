import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/app.locator.dart';
import '../../interfaces/i_storage_service.dart';
import 'encryption_service.dart';

class HiveStorageService implements IStorageService {
  static const String _boxName = 'app_storage';
  final EncryptionService _encryptionService = locator<EncryptionService>();

  @override
  Future<void> init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    await Hive.openBox(_boxName);
  }

  @override
  Future<void> saveData<T>(String key, T value) async {
    try {
      final box = Hive.box(_boxName);
      final jsonString = json.encode(value);
      final encryptedData = _encryptionService.encryptData(jsonString);
      final encryptedKey = _encryptionService.encryptData(key);
      await box.put(encryptedKey, encryptedData);
    } catch (e) {
      if (kDebugMode) debugPrint('Error getting data: $e');
    }
  }

  @override
  T? getData<T>(String key) {
    try {
      final box = Hive.box(_boxName);
      final String encryptedKey = _encryptionService.encryptData(key);
      final encryptedData = box.get(encryptedKey) as String?;

      // * Note [codermuss]:  Decrypt the data if it exists
      if (encryptedData != null) {
        final String decryptedData = _encryptionService.decryptData(encryptedData);
        return json.decode(decryptedData) as T?;
      }
      return null;
    } catch (e) {
      if (kDebugMode) debugPrint('Error getting data: $e');
      return null;
    }
  }

  @override
  Future<void> deleteData(String key) async {
    try {
      final box = Hive.box(_boxName);
      await box.delete(key);
    } catch (e) {
      if (kDebugMode) debugPrint('Error getting data: $e');
    }
  }

  @override
  Future<void> clearAllData() async {
    try {
      final box = Hive.box(_boxName);
      await box.clear();
    } catch (e) {
      if (kDebugMode) debugPrint('Error getting data: $e');
    }
  }
}
