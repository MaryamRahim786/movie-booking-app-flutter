import 'package:go_router/go_router.dart';
import 'package:movies_booking_app/features/home/presentation/views/home_nav_view.dart';
import 'package:movies_booking_app/features/select_seats/presentation/seat_mapping_view.dart';
import 'package:movies_booking_app/features/watch_movies/domain/models/movie_trailer_model.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/movie_details/movie_details_view.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/movie_player/movie_player_view.dart';
import 'package:movies_booking_app/features/watch_movies/presentation/views/movie_player/widgets/trailer_player_widget.dart';
import 'package:movies_booking_app/util/router/paths.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: RoutePaths.movieDetails,
      builder: (context, state) {
        final movieId = state.extra as int;
        return MovieDetailsView(movieId: movieId);
      },
    ),
    GoRoute(
      path: RoutePaths.moviePlayer,
      builder: (context, state) {
        final movieId = state.extra as int;
        return MoviePlayerView(movieId: movieId);
      },
    ), GoRoute(
      path: RoutePaths.trailerPlayer,
      builder: (context, state) {
        final video = state.extra as MovieVideoResult;
        return TrailerPlayerScreen( video: video,);
      },
    ),
    GoRoute(
      path: RoutePaths.movieSeatsMapping,
      builder: (context, state) {
        return const MovieSeatsMappingView();
      },
    ),
  ],
);
