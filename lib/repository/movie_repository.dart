
import 'package:movie_db/api/api_service.dart';
import 'package:movie_db/config/config.dart';
import 'package:movie_db/view_object/holder/query_holder.dart';
import 'package:movie_db/view_object/movie_pagination.dart';

class MovieRepository extends ApiService {
  Future<MoviePagination> getPopularMovies(QueryHolder queryHolder) async {
    String endpoint = "/movie/popular";
    String url =
        '${Config.coreUrl}$endpoint?api_key=${Config.apiKey}&page=${queryHolder.page}&language${queryHolder.language}';
    return getData(url: url, builder: (data) => MoviePagination.fromJson(data));
  }

  Future<MoviePagination?> getNowPlayingMovies(QueryHolder queryHolder) async {
    String endpoint = "/movie/now_playing";
    String url =
        '${Config.coreUrl}$endpoint?api_key=${Config.apiKey}&page=${queryHolder.page}&language${queryHolder.language}';
    return getData(url: url, builder: (data) => MoviePagination.fromJson(data));
  }

  Future<MoviePagination?> getUpcomingMovies(QueryHolder queryHolder) async {
    String endpoint = "/movie/upcoming";
    String url =
        '${Config.coreUrl}$endpoint?api_key=${Config.apiKey}&page=${queryHolder.page}&language${queryHolder.language}';
    return getData(url: url, builder: (data) => MoviePagination.fromJson(data));
  }

  Future<MoviePagination?> getTopRatedMovies(QueryHolder queryHolder) async {
    String endpoint = "/movie/top_rated";
    String url =
        '${Config.coreUrl}$endpoint?api_key=${Config.apiKey}&page=${queryHolder.page}&language${queryHolder.language}';
    return getData(url: url, builder: (data) => MoviePagination.fromJson(data));
  }
}
