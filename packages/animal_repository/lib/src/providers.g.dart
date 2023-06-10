// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$animalRepositoryHash() => r'b817357b6835b0f34d2919e4a249e2eff350fc85';

/// See also [animalRepository].
@ProviderFor(animalRepository)
final animalRepositoryProvider = AutoDisposeProvider<AnimalRepository>.internal(
  animalRepository,
  name: r'animalRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$animalRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnimalRepositoryRef = AutoDisposeProviderRef<AnimalRepository>;
String _$animalHash() => r'9211cfd9bbb05a62f391c9546cd8d5aa892ef024';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef AnimalRef = AutoDisposeFutureProviderRef<Animal>;

/// See also [animal].
@ProviderFor(animal)
const animalProvider = AnimalFamily();

/// See also [animal].
class AnimalFamily extends Family<AsyncValue<Animal>> {
  /// See also [animal].
  const AnimalFamily();

  /// See also [animal].
  AnimalProvider call(
    int id,
  ) {
    return AnimalProvider(
      id,
    );
  }

  @override
  AnimalProvider getProviderOverride(
    covariant AnimalProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'animalProvider';
}

/// See also [animal].
class AnimalProvider extends AutoDisposeFutureProvider<Animal> {
  /// See also [animal].
  AnimalProvider(
    this.id,
  ) : super.internal(
          (ref) => animal(
            ref,
            id,
          ),
          from: animalProvider,
          name: r'animalProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$animalHash,
          dependencies: AnimalFamily._dependencies,
          allTransitiveDependencies: AnimalFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is AnimalProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$animalsStreamHash() => r'ab0e63bf40ea444483fb3de3e6eb1240580f9f22';
typedef AnimalsStreamRef = AutoDisposeStreamProviderRef<List<Animal>>;

/// See also [animalsStream].
@ProviderFor(animalsStream)
const animalsStreamProvider = AnimalsStreamFamily();

/// See also [animalsStream].
class AnimalsStreamFamily extends Family<AsyncValue<List<Animal>>> {
  /// See also [animalsStream].
  const AnimalsStreamFamily();

  /// See also [animalsStream].
  AnimalsStreamProvider call({
    String? name,
    String? location,
    required int page,
    required int limit,
    required AnimalFetchPolicy fetchPolicy,
  }) {
    return AnimalsStreamProvider(
      name: name,
      location: location,
      page: page,
      limit: limit,
      fetchPolicy: fetchPolicy,
    );
  }

  @override
  AnimalsStreamProvider getProviderOverride(
    covariant AnimalsStreamProvider provider,
  ) {
    return call(
      name: provider.name,
      location: provider.location,
      page: provider.page,
      limit: provider.limit,
      fetchPolicy: provider.fetchPolicy,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'animalsStreamProvider';
}

/// See also [animalsStream].
class AnimalsStreamProvider extends AutoDisposeStreamProvider<List<Animal>> {
  /// See also [animalsStream].
  AnimalsStreamProvider({
    this.name,
    this.location,
    required this.page,
    required this.limit,
    required this.fetchPolicy,
  }) : super.internal(
          (ref) => animalsStream(
            ref,
            name: name,
            location: location,
            page: page,
            limit: limit,
            fetchPolicy: fetchPolicy,
          ),
          from: animalsStreamProvider,
          name: r'animalsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$animalsStreamHash,
          dependencies: AnimalsStreamFamily._dependencies,
          allTransitiveDependencies:
              AnimalsStreamFamily._allTransitiveDependencies,
        );

  final String? name;
  final String? location;
  final int page;
  final int limit;
  final AnimalFetchPolicy fetchPolicy;

  @override
  bool operator ==(Object other) {
    return other is AnimalsStreamProvider &&
        other.name == name &&
        other.location == location &&
        other.page == page &&
        other.limit == limit &&
        other.fetchPolicy == fetchPolicy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, fetchPolicy.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$animalTypesHash() => r'93d743910db2c529b163680a99be05576d7c7b0b';

/// See also [animalTypes].
@ProviderFor(animalTypes)
final animalTypesProvider =
    AutoDisposeFutureProvider<List<AnimalTypes>>.internal(
  animalTypes,
  name: r'animalTypesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$animalTypesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnimalTypesRef = AutoDisposeFutureProviderRef<List<AnimalTypes>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
