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

  Stream<List<Animal>> getAnimalListStream({
    String? name,
    String? location,
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
        location: location,
      );

      yield networkResults.animalList;
    } else {
      // final cacheResults = await localStorage.animalsPaginated(
      //   page: page,
      //   limit: limit,
      // );

      final cacheResults = await localStorage.getAllAnimals();

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
          location: location,
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

  Future<List<AnimalTypes>> getAnimalTypes() async {
    final animalTypesFromCache = await localStorage.getAnimalTypes();

    if (animalTypesFromCache.isNotEmpty) {
      return animalTypesFromCache.map((e) => e.toDomainModel()).toList();
    }

    final animalTypesFromNetwork = await remoteApi.getAnimalTypes();

    final animalTypesToStoreInCache =
        animalTypesFromNetwork.types.map((e) => e.toCacheModel()).toList();

    await localStorage.insertAnimalTypes(animalTypesToStoreInCache);

    return animalTypesFromNetwork.types.map((e) => e.toDomainModel()).toList();
  }

  // Future<List<Animal>> getAnimalListPaged({
  //   String? name,
  //   String? location,
  //   required int page,
  //   required int limit,
  //   required AnimalFetchPolicy fetchPolicy,
  // }) async {
  //   final isSearching = name != null;
  //   final isFetchPolicyNetworkOnly =
  //       fetchPolicy == AnimalFetchPolicy.networkOnly;

  //   final shouldSkipCacheLookup = isSearching || isFetchPolicyNetworkOnly;

  //   if (shouldSkipCacheLookup) {
  //     final networkResults = await _getAnimalsFromNetwork(
  //       name: name,
  //       page: page,
  //       limit: limit,
  //       fetchPolicy: fetchPolicy,
  //       location: location,
  //     );

  //     return networkResults.animalList;
  //   } else {
  //     final cacheResults = await localStorage.animalsPaginated(
  //       page: page,
  //       limit: limit,
  //     );

  //     // final isFetchPolicyCacheAndNetwork =
  //     //     fetchPolicy == AnimalFetchPolicy.cacheAndNetwork;

  //     // final isFetchPolicyCachePreferably =
  //     //     fetchPolicy == AnimalFetchPolicy.cachePreferably;

  //     // final shouldReturnCachedPageInAdvance =
  //     //     isFetchPolicyCachePreferably || isFetchPolicyCacheAndNetwork;

  //     // if (shouldReturnCachedPageInAdvance && cacheResults.isNotEmpty) {
  //     //   return cacheResults.map((e) => e.toDomainModel()).toList();
  //     // }

  //     try {
  //       final networkResults = await _getAnimalsFromNetwork(
  //         name: name,
  //         page: page,
  //         limit: limit,
  //         fetchPolicy: fetchPolicy,
  //         location: location,
  //       );

  //       return networkResults.animalList;
  //     } catch (_) {
  //       final isFetchPolicyNetworkPreferably =
  //           fetchPolicy == AnimalFetchPolicy.networkPreferably;
  //       if (cacheResults.isNotEmpty && isFetchPolicyNetworkPreferably) {
  //         return cacheResults.map((e) => e.toDomainModel()).toList();
  //       }

  //       rethrow;
  //     }
  //   }
  // }

  Future<AnimalListPage> _getAnimalsFromNetwork({
    String? name,
    String? location,
    int? distance = 500,
    required int page,
    required int limit,
    required AnimalFetchPolicy fetchPolicy,
  }) async {
    final results = await remoteApi.getAnimals(
      page: page,
      name: name,
      limit: limit,
      location: location,
      distance: distance,
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
  /// Fetches from cache and network, and emits the cached results first.
  cacheAndNetwork,

  /// Fetches from network only.
  networkOnly,

  /// Fetches from network and cache, and emits the network results first.
  networkPreferably,

  /// Fetches from cache only.
  cachePreferably,
}
