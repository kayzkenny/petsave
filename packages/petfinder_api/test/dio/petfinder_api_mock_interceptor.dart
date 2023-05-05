import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/response/animals_response_data.dart';

class PetfinderApiMockInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    switch (options.path) {
      case animalsPath:
        handler.resolve(
          Response(
            requestOptions: options,
            data: jsonDecode(animalsResponseString),
          ),
        );
        break;
      default:
        super.onRequest(options, handler);
    }
  }
}
