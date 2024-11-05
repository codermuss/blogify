abstract interface class IStorageService {
  Future<void> init();
  Future<void> saveData<T>(String key, T value);
  T? getData<T>(String key);
  Future<void> deleteData(String key);
  Future<void> clearAllData();
}
