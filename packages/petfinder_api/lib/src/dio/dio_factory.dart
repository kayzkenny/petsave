import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'interceptors/petfinder_api_interceptor.dart';

/// Factory for the Dio client used by the Asset Management API.
class AssetMgmtDioFactory {
  /// Constructor.
  AssetMgmtDioFactory(this._baseUrl, this._interceptor);

  final String _baseUrl;
  final PetfinderApiInterceptor _interceptor;

  /// Creates a Dio client.
  Dio create() => Dio(_createBaseOptions())..interceptors.add(_interceptor);

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      );
}

/// Creates a Dio client.
///
/// To used by the repositories.
Dio createDio() {
  final apiInterceptor = PetfinderApiInterceptor();
  final dioFactory =
      AssetMgmtDioFactory(ApiConstants.apiBaseUrl, apiInterceptor);

  return dioFactory.create();
}
