// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_youtube_trailer_video_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getYoutubeTrailerHash() => r'e813c0d4ba87e6b29a414c88d9fc607ae8410ccc';

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

/// See also [getYoutubeTrailer].
@ProviderFor(getYoutubeTrailer)
const getYoutubeTrailerProvider = GetYoutubeTrailerFamily();

/// See also [getYoutubeTrailer].
class GetYoutubeTrailerFamily extends Family<AsyncValue<MovieVideoResult>> {
  /// See also [getYoutubeTrailer].
  const GetYoutubeTrailerFamily();

  /// See also [getYoutubeTrailer].
  GetYoutubeTrailerProvider call({
    required int movieId,
  }) {
    return GetYoutubeTrailerProvider(
      movieId: movieId,
    );
  }

  @override
  GetYoutubeTrailerProvider getProviderOverride(
    covariant GetYoutubeTrailerProvider provider,
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
  String? get name => r'getYoutubeTrailerProvider';
}

/// See also [getYoutubeTrailer].
class GetYoutubeTrailerProvider
    extends AutoDisposeFutureProvider<MovieVideoResult> {
  /// See also [getYoutubeTrailer].
  GetYoutubeTrailerProvider({
    required int movieId,
  }) : this._internal(
          (ref) => getYoutubeTrailer(
            ref as GetYoutubeTrailerRef,
            movieId: movieId,
          ),
          from: getYoutubeTrailerProvider,
          name: r'getYoutubeTrailerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getYoutubeTrailerHash,
          dependencies: GetYoutubeTrailerFamily._dependencies,
          allTransitiveDependencies:
              GetYoutubeTrailerFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  GetYoutubeTrailerProvider._internal(
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
    FutureOr<MovieVideoResult> Function(GetYoutubeTrailerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetYoutubeTrailerProvider._internal(
        (ref) => create(ref as GetYoutubeTrailerRef),
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
  AutoDisposeFutureProviderElement<MovieVideoResult> createElement() {
    return _GetYoutubeTrailerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetYoutubeTrailerProvider && other.movieId == movieId;
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
mixin GetYoutubeTrailerRef on AutoDisposeFutureProviderRef<MovieVideoResult> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _GetYoutubeTrailerProviderElement
    extends AutoDisposeFutureProviderElement<MovieVideoResult>
    with GetYoutubeTrailerRef {
  _GetYoutubeTrailerProviderElement(super.provider);

  @override
  int get movieId => (origin as GetYoutubeTrailerProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
