import 'package:movie_db/view_object/movie.dart';

class MoviePagination {
  MoviePagination(
      {this.page, this.results, this.totalPages, this.totalResults});

  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  MoviePagination.fromJson(Map<String, dynamic> json) {
    List<Movie> dataList = [];
    json['results'].forEach((v) {
      dataList.add(Movie.fromJson(v));
    });

    page = json['page'];
    results = dataList;
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
