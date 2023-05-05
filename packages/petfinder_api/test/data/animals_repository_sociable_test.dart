import 'package:animal_repository/animal_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petfinder_api/petfinder_api.dart';
// import 'package:test/test.dart';

import '../dio/petfinder_api_mock_interceptor.dart';
import '../models/response/animals_response_data.dart';

void main() {
  late Dio dio;
  late PetFinderApi api;

  setUp(() {
    dio = Dio();
    api = PetFinderApi(dio);
  });

  test('getAnimals returns data from the api', () async {
    // arrange
    dio.interceptors.add(PetfinderApiMockInterceptor());

    // act
    final data = await api.getAnimals();

    // assert
    expect(data.toDomainModel().pagination,
        animalsResponseData.toDomainModel().pagination);
    expect(data.toDomainModel().animalList.first.breeds,
        animalsResponseData.toDomainModel().animalList.first.breeds);
    expect(data.toDomainModel().animalList.first.colors,
        animalsResponseData.toDomainModel().animalList.first.colors);
  });
}
