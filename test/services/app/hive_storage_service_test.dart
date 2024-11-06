// import 'package:blogify/app/app.locator.dart';
// import 'package:blogify/services/app/hive_storage_service.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../../helpers/test_helpers.dart';

// void main() {
//   group(
//     'HiveStorageServiceTest -',
//     () {
//       setUp(() => registerServices());
//       tearDown(() => locator.reset());

//       test('should save data', () async {
//         HiveStorageService mockHiveStorageService = getAndRegisterHiveStorageService();
//         when(mockHiveStorageService.saveData(any,any)).thenAnswer((_) async => true);

//         final result = await mockHiveStorageService.saveData(
//           key: 'testKey',
//           value: 'testValue',
//         );

//         expect(result, true);
//         verify(mockHiveStorageService.saveData(key: 'testKey', value: 'testValue')).called(1);
//       });

//       test('should read data', () async {
//         when(mockHiveStorageService.readData('testKey')).thenAnswer((_) async => 'testValue');

//         final result = await mockHiveStorageService.readData('testKey');

//         expect(result, 'testValue');
//         verify(mockHiveStorageService.readData('testKey')).called(1);
//       });

//       test('should delete data', () async {
//         when(mockHiveStorageService.deleteData('testKey')).thenAnswer((_) async => true);

//         final result = await mockHiveStorageService.deleteData('testKey');

//         expect(result, true);
//         verify(mockHiveStorageService.deleteData('testKey')).called(1);
//       });
//     },
//   );
// }
