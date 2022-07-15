


import 'package:todo_app/resources/logger.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


abstract class TodoApi {
   final Dio client;

  TodoApi(this.client);
}

const _baseUrl = 'https://gorest.co.in/';

@LazySingleton(as: TodoApi)
class TodoApiImpl implements TodoApi {
  @override
  late final Dio client;

  TodoApiImpl() {
    client = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );

    client.interceptors
      .add(ErrorHandleInterceptor());
  }
}


class ErrorHandleInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Log.error(err.toString());
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200) {
      Log.error('Error code: ${response.statusCode}');
    }

    handler.next(response);
  }
}