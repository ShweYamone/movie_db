import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_db/api/api_service.dart';
import 'package:movie_db/config/config.dart';
import 'package:movie_db/view_object/holder/query_holder.dart';
import 'package:movie_db/view_object/movie_pagination.dart';

class MovieRepository extends ApiService {
  Future<MoviePagination?> getPopularMovies(QueryHolder queryHolder) async {
    String endpoint = "/movie/popular";
    Response response = await get(Uri.parse(
        '${Config.coreUrl}$endpoint?api_key=${Config.apiKey}&page=${queryHolder.page}&language${queryHolder.language}'));
  
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      MoviePagination moviePagination = MoviePagination.fromJson(body);
      return moviePagination;
    } else {
      return null;
    }
  }

  Future<MoviePagination?> getNowPlayingMovies(QueryHolder queryHolder) async {
    String endpoint =
        "/movie/now_playing";
    Response response = await get(Uri.parse(
        '${Config.coreUrl}$endpoint?api_key=${Config.apiKey}&page=${queryHolder.page}&language${queryHolder.language}'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      MoviePagination moviePagination = MoviePagination.fromJson(body);
      return moviePagination;
    } else {
      return null;
    }
  }

  Future<MoviePagination?> getUpcomingMovies(QueryHolder queryHolder) async {
    String endpoint =
        "/movie/upcoming";
    Response response = await get(Uri.parse(
        '${Config.coreUrl}$endpoint?api_key=${Config.apiKey}&page=${queryHolder.page}&language${queryHolder.language}'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      MoviePagination moviePagination = MoviePagination.fromJson(body);
      return moviePagination;
    } else {
      return null;
    }
  }

  Future<MoviePagination?> getTopRatedMovies(QueryHolder queryHolder) async {
    String endpoint =
        "/movie/top_rated";
    Response response = await get(Uri.parse(
        '${Config.coreUrl}$endpoint?api_key=${Config.apiKey}&page=${queryHolder.page}&language${queryHolder.language}'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      MoviePagination moviePagination = MoviePagination.fromJson(body);
      return moviePagination;
    } else {
      return null;
    }
  }
}
