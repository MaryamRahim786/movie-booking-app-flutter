// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMovieDetailsHash() => r'736ccb1cb8e86e8bffa15a5877576b7b4e29933f';

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

/// See also [getMovieDetails].
@ProviderFor(getMovieDetails)
const getMovieDetailsProvider = GetMovieDetailsFamily();

/// See also [getMovieDetails].
class GetMovieDetailsFamily extends Family<AsyncValue<MovieDetailsModel>> {
  /// See also [getMovieDetails].
  const GetMovieDetailsFamily();

  /// See also [getMovieDetails].
  GetMovieDetailsProvider call({
    required int movieId,
  }) {
    return GetMovieDetailsProvider(
      movieId: movieId,
    );
  }

  @override
  GetMovieDetailsProvider getProviderOverride(
    covariant GetMovieDetailsProvider provider,
  ) {
    return call(
      movieId: provider.movieId,
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
  String? get name => r'getMovieDetailsProvider';
}

/// See also [getMovieDetails].
class GetMovieDetailsProvider
    extends AutoDisposeFutureProvider<MovieDetailsModel> {
  /// See also [getMovieDetails].
  GetMovieDetailsProvider({
    required int movieId,
  }) : this._internal(
          (ref) => getMovieDetails(
            ref as GetMovieDetailsRef,
            movieId: movieId,
          ),
          from: getMovieDetailsProvider,
          name: r'getMovieDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMovieDetailsHash,
          dependencies: GetMovieDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetMovieDetailsFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  GetMovieDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<MovieDetailsModel> Function(GetMovieDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMovieDetailsProvider._internal(
        (ref) => create(ref as GetMovieDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MovieDetailsModel> createElement() {
    return _GetMovieDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMovieDetailsProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMovieDetailsRef on AutoDisposeFutureProviderRef<MovieDetailsModel> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _GetMovieDetailsProviderElement
    extends AutoDisposeFutureProviderElement<MovieDetailsModel>
    with GetMovieDetailsRef {
  _GetMovieDetailsProviderElement(super.provider);

  @override
  int get movieId => (origin as GetMovieDetailsProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
