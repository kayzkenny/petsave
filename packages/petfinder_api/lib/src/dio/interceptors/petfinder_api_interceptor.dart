import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Interceptor for the Petfinder API.
class PetfinderApiInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Content-Type'] = 'application/json';
    print(options.path);

    if (!options.path.startsWith('/oauth2')) {
      final sp = await SharedPreferences.getInstance();
      final token = sp.getString('accessTokenKey');
      print(token);
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    return super.onRequest(options, handler);
  }
}
