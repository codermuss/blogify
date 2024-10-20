class BaseResponse<T> {
  // Different response types
  const BaseResponse._();

  factory BaseResponse.success(T data, ResponseMessageModel? message) = SuccessResponse<T>;

  factory BaseResponse.noContent(ResponseMessageModel? message) = NoContentResponse;

  factory BaseResponse.error(ResponseMessageModel? error) = ErrorResponse;

  // 'when' method to handle all cases
  R when<R extends Object?>({
    required R Function(T data, ResponseMessageModel? message) success,
    required R Function(ResponseMessageModel? message) noContent,
    required R Function(ResponseMessageModel? error) error,
  }) {
    if (this is SuccessResponse<T>) {
      return success(
        (this as SuccessResponse<T>).data,
        (this as SuccessResponse<T>).message,
      );
    } else if (this is NoContentResponse) {
      return noContent((this as NoContentResponse).message);
    } else if (this is ErrorResponse) {
      return error((this as ErrorResponse).error);
    }
    throw Exception('Invalid response type');
  }
}

// SuccessResponse class
class SuccessResponse<T> extends BaseResponse<T> {
  final T data;
  final ResponseMessageModel? message;

  SuccessResponse(this.data, this.message) : super._();
}

// NoContentResponse class
class NoContentResponse<T> extends BaseResponse<T> {
  final ResponseMessageModel? message;

  NoContentResponse(this.message) : super._();
}

// ErrorResponse class
class ErrorResponse<T> extends BaseResponse<T> {
  final ResponseMessageModel? error;
  ErrorResponse(this.error) : super._();
}

// Example of ResponseMessageModel class
final class ResponseMessageModel {
  final String text;
  final String? type;

  ResponseMessageModel({
    required this.text,
    this.type,
  });
}
