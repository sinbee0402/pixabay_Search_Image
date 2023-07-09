abstract class Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.error(String e) = Error;
}

class Success<T> implements Result<T> {
  final T data;

  const Success(this.data);
}

class Error<T> implements Result<T> {
  final String e;

  const Error(this.e);
}
