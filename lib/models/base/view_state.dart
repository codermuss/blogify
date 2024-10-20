abstract class ViewState<T> {
  const ViewState();

  factory ViewState.busy() = BusyState<T>;
  factory ViewState.data(T data) = DataState<T>;
  factory ViewState.empty() = EmptyState<T>;
  factory ViewState.error(String message) = ErrorState<T>;

  R when<R>({
    required R Function() busy,
    required R Function(T data) data,
    required R Function() empty,
    required R Function(String message) error,
  }) {
    if (this is BusyState<T>) {
      return busy();
    } else if (this is DataState<T>) {
      return data((this as DataState<T>).data);
    } else if (this is EmptyState<T>) {
      return empty();
    } else if (this is ErrorState<T>) {
      return error((this as ErrorState<T>).message);
    }
    throw StateError('Unhandled state: $this');
  }

  R? whenOrNull<R>({
    R Function()? busy,
    R Function(T data)? data,
    R Function()? empty,
    R Function(String message)? error,
  }) {
    if (this is BusyState<T>) {
      return busy?.call();
    } else if (this is DataState<T>) {
      return data?.call((this as DataState<T>).data);
    } else if (this is EmptyState<T>) {
      return empty?.call();
    } else if (this is ErrorState<T>) {
      return error?.call((this as ErrorState<T>).message);
    }
    return null;
  }
}

class BusyState<T> extends ViewState<T> {
  const BusyState();
}

class DataState<T> extends ViewState<T> {
  final T data;

  const DataState(this.data);
}

class EmptyState<T> extends ViewState<T> {
  const EmptyState();
}

class ErrorState<T> extends ViewState<T> {
  final String message;

  const ErrorState(this.message);
}
