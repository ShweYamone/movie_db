import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_db/repository/movie_repository.dart';
import 'package:movie_db/view_object/holder/query_holder.dart';
import 'package:movie_db/view_object/movie_pagination.dart';

final moviesRepositoryProvider = Provider((ref) => MovieRepository());

final popularMoviesProvider = FutureProvider<MoviePagination>((ref) {
  // access the provider above
  final repository = ref.watch(moviesRepositoryProvider);
  // use it to return a Future
  return repository.getPopularMovies(QueryHolder(page: 1));
});

final nowPlayingMoviesProvider = FutureProvider<MoviePagination?>((ref) {
  return ref
      .watch(moviesRepositoryProvider)
      .getNowPlayingMovies(QueryHolder(page: 1));
});

final upcomingMoviesProvider = FutureProvider<MoviePagination?>((ref) {
  return ref
      .watch(moviesRepositoryProvider)
      .getUpcomingMovies(QueryHolder(page: 1));
});

final topRatedMoviesProvider = FutureProvider<MoviePagination?>((ref) {
  return ref
      .watch(moviesRepositoryProvider)
      .getTopRatedMovies(QueryHolder(page: 1));
});

// final searchAllMediaProvider =
//     FutureProvider.family<AllMediaPagination, QueryHolder>((ref, QueryHolder holder) {
//   return ref.watch(moviesRepositoryProvider).searchAllMedia(holder);
// });
