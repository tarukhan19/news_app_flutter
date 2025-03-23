import 'package:dio/dio.dart';

/*
it communicate with network call. this wrapper class will use to wrap our entire network call.
 */
abstract class DataState<T> {
  final T? data;
  final DioError? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioError error) : super(error: error);
}
