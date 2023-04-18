import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petfinder_api/src/models/response/animal_list_page_rm.dart';
import 'package:petfinder_api/src/models/response/organization_list_page_rm.dart';
import 'package:retrofit/retrofit.dart';

import 'dio/dio_factory.dart';
import 'models/response/auth_response_rm.dart';

part 'petfinder_api_base.g.dart';

@RestApi()
abstract class PetFinderApi {
  factory PetFinderApi(Dio dio) = _PetFinderApi;

  @POST('/oauth2/token')
  @FormUrlEncoded()
  Future<AuthResponseRM> getAuthToken({
    @Field('grant_type') required String grantType,
    @Field('client_id') required String clientId,
    @Field('client_secret') required String clientSecret,
  });

  @GET('/animals')
  Future<AnimalListPageRM> getAnimals({
    @Query('type') String? type,
    @Query('breed') String? breed,
    @Query('size') String? size,
    @Query('gender') String? gender,
    @Query('age') String? age,
    @Query('color') String? color,
    @Query('coat') String? coat,
    @Query('status') String? status,
    @Query('name') String? name,
    @Query('organization') String? organization,
    @Query('good_with_children') bool? goodWithChildren,
    @Query('good_with_dogs') bool? goodWithDogs,
    @Query('good_with_cats') bool? goodWithCats,
    @Query('house_trained') bool? houseTrained,
    @Query('declawed') bool? declawed,
    @Query('location') String? location,
    @Query('distance') int? distance,
    @Query('before') String? before,
    @Query('after') String? after,
    @Query('sort') String? sort,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('/organizations')
  Future<OrganizationListPageRM> getOrganizations({
    @Query('name') String? name,
    @Query('location') String? location,
    @Query('distance') int? distance,
    @Query('state') String? state,
    @Query('country') String? country,
    @Query('query') String? query,
    @Query('sort') String? sort,
    @Query('limit') int? limit,
    @Query('page') int? page,
  });
}

final apiPod = Provider<PetFinderApi>((ref) {
  final dio = createDio();

  return PetFinderApi(dio);
});
