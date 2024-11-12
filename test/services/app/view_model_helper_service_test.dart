import 'package:blogify/app/app.locator.dart';
import 'package:blogify/models/base/base_response.dart';
import 'package:blogify/models/base/view_state.dart';
import 'package:blogify/services/app/view_model_helper_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_toast/i_toast.dart';

import '../../helpers/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ViewModelHelperServiceTest -', () {
    late ViewModelHelperService service;

    setUp(() {
      registerServices();
      service = ViewModelHelperService();
    });

    tearDown(() => locator.reset());

    group('state management -', () {
      test('getStateForObject should return busy state for new reference', () {
        final ViewState state = service.getStateForObject('test');
        expect(state, isA<BusyState>());
      });

      test('setStateForObject should update state and call notifyListeners', () {
        bool notifierCalled = false;
        const DataState<String> newState = DataState<String>('test data');

        service.setStateForObject('test', newState, () => notifierCalled = true);

        expect(service.getStateForObject('test'), equals(newState));
        expect(notifierCalled, true);
      });

      test('getModel should return null for non-existent reference', () {
        final String? model = service.getModel<String>('test');
        expect(model, isNull);
      });

      test('getModel should return data for existing reference', () {
        const String testData = 'test data';
        service.setStateForObject('test', const DataState<String>(testData), () {});

        final String? model = service.getModel<String>('test');
        expect(model, equals(testData));
      });

      test('clearStates should remove all states', () {
        service.setStateForObject('test1', const DataState<String>('data1'), () {});
        service.setStateForObject('test2', const DataState<String>('data2'), () {});

        service.clearStates();

        expect(service.getStateForObject('test1'), isA<BusyState>());
        expect(service.getStateForObject('test2'), isA<BusyState>());
      });
    });

    group('request handling -', () {
      test('handleViewStateByRequest should handle success response', () async {
        const String testData = 'test data';
        request() async => BaseResponse<String>.success(testData, null);

        bool notifierCalled = false;
        final String? result = await service.handleViewStateByRequest(
          'test',
          request,
          () => notifierCalled = true,
        );

        expect(result, equals(testData));
        expect(service.getStateForObject('test'), isA<DataState<String>>());
        expect(notifierCalled, true);
      });

      test('handleViewStateByRequest should handle empty list response', () async {
        request() async => BaseResponse<List<String>>.success(const [], null);

        await service.handleViewStateByRequest(
          'test',
          request,
          () {},
        );

        expect(service.getStateForObject('test'), isA<EmptyState>());
      });

      test('handleViewStateByRequest should handle error response', () async {
        const String errorText = 'Error occurred';
        final ResponseMessageModel errorMessage = ResponseMessageModel(text: errorText);
        request() async => BaseResponse<String>.error(errorMessage);

        await service.handleViewStateByRequest(
          'test',
          request,
          () {},
        );

        final ViewState state = service.getStateForObject('test');
        expect(state, isA<ErrorState>());
        expect((state as ErrorState).message, equals(errorText));
      });
    });

    group('request model creation -', () {
      test('createRequestModel should return value when validation passes', () {
        validate() => 'valid data';
        final String? result = service.createRequestModel(validate);
        expect(result, equals('valid data'));
      });

      test('createRequestModel should return null and show toast when validation fails', () {
        validate() => null;
        final String? result = service.createRequestModel(validate);
        expect(result, isNull);
      });
    });

    group('loading operations -', () {
      test('runLoadingFuture should handle successful response', () async {
        const String testData = 'test data';
        request() async => BaseResponse<String>.success(testData, null);

        final String? result = await service.runLoadingFuture(request, () {});

        expect(result, equals(testData));
      });

      test('runLoadingVoid should execute request without error', () async {
        bool executed = false;
        request() async {
          executed = true;
        }

        await service.runLoadingVoid(request);

        expect(executed, true);
      });
    });

    group('toast handling -', () {
      test('showToast should handle null title', () {
        service.showToast(
          description: 'Test message',
          toastType: ToastType.success,
        );
      });
    });
  });
}
