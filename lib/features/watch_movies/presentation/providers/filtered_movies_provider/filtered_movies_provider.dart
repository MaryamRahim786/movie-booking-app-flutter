import 'package:movies_booking_app/common/extensions/color_print_extension.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movies_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/providers/get_movies_provider/get_movies_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_movies_provider.g.dart';

@riverpod
class FilteredMovies extends _$FilteredMovies {
  @override
  List<Movie> build() {
    return [];
  }

  Future<void> filterMovies(String searchQuery) async {
    final movies = await ref.read(getMoviesProvider.future);
    final trimmedQuery = searchQuery.trim().toLowerCase();
    if (trimmedQuery.isEmpty) {
      state = movies;
      "state trimmedQuery.isEmpty: ${state.length}".printBoldRed();
    } else {
      state = movies.where((movie) {
        return movie.title.toLowerCase().contains(trimmedQuery);
      }).toList();
      "state else: ${state.length}".printBoldRed();
    }
  }

  clearFilter() {
    state = [];
  }
}
