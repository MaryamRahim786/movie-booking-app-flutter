// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_trailer_videos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMovieTrailerVideosHash() =>
    r'171bc35dc253e4d38c6b32a559d027dd7f64f3e1';

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

/// See also [getMovieTrailerVideos].
@ProviderFor(getMovieTrailerVideos)
const getMovieTrailerVideosProvider = GetMovieTrailerVideosFamily();

/// See also [getMovieTrailerVideos].
class GetMovieTrailerVideosFamily
    extends Family<AsyncValue<MovieTrailerVideosModel>> {
  /// See also [getMovieTrailerVideos].
  const GetMovieTrailerVideosFamily();

  /// See also [getMovieTrailerVideos].
  GetMovieTrailerVideosProvider call({
    required int movieId,
  }) {
    return GetMovieTrailerVideosProvider(
      movieId: movieId,
    );
  }

  @override
  GetMovieTrailerVideosProvider getProviderOverride(
    covariant GetMovieTrailerVideosProvider provider,
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
  String? get name => r'getMovieTrailerVideosProvider';
}

/// See also [getMovieTrailerVideos].
class GetMovieTrailerVideosProvider
    extends AutoDisposeFutureProvider<MovieTrailerVideosModel> {
  /// See also [getMovieTrailerVideos].
  GetMovieTrailerVideosProvider({
    required int movieId,
  }) : this._internal(
          (ref) => getMovieTrailerVideos(
            ref as GetMovieTrailerVideosRef,
            movieId: movieId,
          ),
          from: getMovieTrailerVideosProvider,
          name: r'getMovieTrailerVideosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMovieTrailerVideosHash,
          dependencies: GetMovieTrailerVideosFamily._dependencies,
          allTransitiveDependencies:
              GetMovieTrailerVideosFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  GetMovieTrailerVideosProvider._internal(
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
    FutureOr<MovieTrailerVideosModel> Function(
            GetMovieTrailerVideosRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMovieTrailerVideosProvider._internal(
        (ref) => create(ref as GetMovieTrailerVideosRef),
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
  AutoDisposeFutureProviderElement<MovieTrailerVideosModel> createElement() {
    return _GetMovieTrailerVideosProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMovieTrailerVideosProvider && other.movieId == movieId;
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
mixin GetMovieTrailerVideosRef
    on AutoDisposeFutureProviderRef<MovieTrailerVideosModel> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _GetMovieTrailerVideosProviderElement
    extends AutoDisposeFutureProviderElement<MovieTrailerVideosModel>
    with GetMovieTrailerVideosRef {
  _GetMovieTrailerVideosProviderElement(super.provider);

  @override
  int get movieId => (origin as GetMovieTrailerVideosProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
