import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:petfinder_api/src/models/response/auth_response_rm.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Interceptor for the Petfinder API.
class PetfinderApiInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Content-Type'] = 'application/json';

    if (!options.path.startsWith('/Authentication')) {
      final sp = await SharedPreferences.getInstance();
      final json = sp.getString('accessTokenKey');
      if (json != null) {
        final authResponse = AuthResponseRM.fromJson(jsonDecode(json));
        final token = authResponse.accessToken;
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    return super.onRequest(options, handler);
  }
}
