// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petfinder_api_base.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PetFinderApi implements PetFinderApi {
  _PetFinderApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthResponseRM> getAuthToken({
    required grantType,
    required clientId,
    required clientSecret,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'grant_type': grantType,
      'client_id': clientId,
      'client_secret': clientSecret,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AuthResponseRM>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/oauth2/token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthResponseRM.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AnimalListPageRM> getAnimals({
    type,
    breed,
    size,
    gender,
    age,
    color,
    coat,
    status,
    name,
    organization,
    goodWithChildren,
    goodWithDogs,
    goodWithCats,
    houseTrained,
    declawed,
    location,
    distance,
    before,
    after,
    sort,
    page,
    limit,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'breed': breed,
      r'size': size,
      r'gender': gender,
      r'age': age,
      r'color': color,
      r'coat': coat,
      r'status': status,
      r'name': name,
      r'organization': organization,
      r'good_with_children': goodWithChildren,
      r'good_with_dogs': goodWithDogs,
      r'good_with_cats': goodWithCats,
      r'house_trained': houseTrained,
      r'declawed': declawed,
      r'location': location,
      r'distance': distance,
      r'before': before,
      r'after': after,
      r'sort': sort,
      r'page': page,
      r'limit': limit,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AnimalListPageRM>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/animals',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AnimalListPageRM.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AnimalDataRM> getAnimalById({required id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AnimalDataRM>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/animals/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AnimalDataRM.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrganizationListPageRM> getOrganizations({
    name,
    location,
    distance,
    state,
    country,
    query,
    sort,
    limit,
    page,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'name': name,
      r'location': location,
      r'distance': distance,
      r'state': state,
      r'country': country,
      r'query': query,
      r'sort': sort,
      r'limit': limit,
      r'page': page,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrganizationListPageRM>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/organizations',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrganizationListPageRM.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrganizationDataRM> getOrganizationById({required id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OrganizationDataRM>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/organizations/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrganizationDataRM.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AnimalTypesDataRM> getAnimalTypes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AnimalTypesDataRM>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/types',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AnimalTypesDataRM.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AnimalDataRM> getSingleAnimalType({required type}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AnimalDataRM>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/types/${type}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AnimalDataRM.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
