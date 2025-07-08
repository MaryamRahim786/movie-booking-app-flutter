class Apis {
  Apis._();

  /// [ BASE URL ]
  static const baseUrl =
      'https://api.themoviedb.org/3/movie'; // Replace it with remote Config base Url, If you are using remote config

  /// [Movies]
  static const movies = '$baseUrl/upcoming';

  /// [Movie Details]
  static String movieDetails(String movieId) => '$baseUrl/$movieId';

  /// [Movie Details]
  static String movieTrailerVideos(String movieId) => '$baseUrl/$movieId/videos';
}
