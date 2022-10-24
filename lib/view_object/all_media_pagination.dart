import 'package:movie_db/view_object/movie.dart';
import 'package:movie_db/view_object/person.dart';
import 'package:movie_db/view_object/tv_show.dart';

class AllMediaPagination {
  AllMediaPagination(
      {this.page, this.results, this.totalPages, this.totalResults});

  int? page;
  List<dynamic>? results;
  int? totalPages;
  int? totalResults;

  AllMediaPagination.fromJson(Map<String, dynamic> json) {
    List<dynamic> dataList = [];
    json['results'].forEach((v) {
      if (v['media_type'] == 'movie') {
        dataList.add(Movie.fromJson(v));
      } else if (v['media_type'] == 'tv') {
        dataList.add(TVShow.fromJson(v));
      } else if (v['media_type'] == 'person') {
        dataList.addAll(Person.fromJson(v).knownFor!);
      }
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
