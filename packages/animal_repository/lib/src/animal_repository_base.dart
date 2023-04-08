import 'package:animal_repository/src/mappers/mappers.dart';
import 'package:domain_models/domain_models.dart';
import 'package:local_storage/local_storage.dart';
import 'package:petfinder_api/petfinder_api.dart';

class AnimalRepository {
  AnimalRepository({
    required this.remoteApi,
    required this.localStorage,
  });

  final PetFinderApi remoteApi;
  final LocalStorage localStorage;

  Stream<List<Animal>> getAnimalListPage({
    String? name,
    required int page,
    required int limit,
    required AnimalFetchPolicy fetchPolicy,
  }) async* {
    final isSearching = name != null;
    final isFetchPolicyNetworkOnly =
        fetchPolicy == AnimalFetchPolicy.networkOnly;

    final shouldSkipCacheLookup = isSearching || isFetchPolicyNetworkOnly;

    if (shouldSkipCacheLookup) {
      final networkResults = await _getAnimalsFromNetwork(
        name: name,
        page: page,
        limit: limit,
        fetchPolicy: fetchPolicy,
      );

      yield networkResults.animalList;
    } else {
      final cacheResults = await localStorage.animalsPaginated(
        page: page,
        limit: limit,
      );

      final isFetchPolicyCacheAndNetwork =
          fetchPolicy == AnimalFetchPolicy.cacheAndNetwork;

      final isFetchPolicyCachePreferably =
          fetchPolicy == AnimalFetchPolicy.cachePreferably;

      final shouldEmitCachedPageInAdvance =
          isFetchPolicyCachePreferably || isFetchPolicyCacheAndNetwork;

      if (shouldEmitCachedPageInAdvance && cacheResults.isNotEmpty) {
        yield cacheResults.map((e) => e.toDomainModel()).toList();
        if (isFetchPolicyCachePreferably) {
          return;
        }
      }

      try {
        final networkResults = await _getAnimalsFromNetwork(
          name: name,
          page: page,
          limit: limit,
          fetchPolicy: fetchPolicy,
        );

        yield networkResults.animalList;
      } catch (_) {
        final isFetchPolicyNetworkPreferably =
            fetchPolicy == AnimalFetchPolicy.networkPreferably;
        if (cacheResults.isNotEmpty && isFetchPolicyNetworkPreferably) {
          yield cacheResults.map((e) => e.toDomainModel()).toList();
          return;
        }

        rethrow;
      }
    }
  }

  Future<AnimalListPage> _getAnimalsFromNetwork({
    String? name,
    required int page,
    required int limit,
    required AnimalFetchPolicy fetchPolicy,
  }) async {
    final results = await remoteApi.getAnimals(
      page: page,
      name: name,
      limit: limit,
    );

    final isFiltering = name != null;

    final shouldStoreOnCache = !isFiltering;
    if (shouldStoreOnCache) {
      final shouldEmptyCache = page == 1;
      if (shouldEmptyCache) {
        await localStorage.clearAllAnimals();
      }

      final cacheModels =
          results.animalList.map((e) => e.toCacheModel()).toList();
      await localStorage.insertAnimals(cacheModels);
    }

    return results.toDomainModel();
  }
}

enum AnimalFetchPolicy {
  cacheAndNetwork,
  networkOnly,
  networkPreferably,
  cachePreferably,
}
