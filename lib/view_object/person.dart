import 'package:movie_db/view_object/movie.dart';
import 'package:movie_db/view_object/tv_show.dart';

class Person {
  String? profilePath;
  bool? adult;
  int? id;
  String? mediaType;
  List<dynamic>? knownFor;
  String? name;
  double? popularity;

  Person(
      {this.profilePath,
      this.adult,
      this.id,
      this.mediaType,
      this.knownFor,
      this.name,
      this.popularity});

  Person.fromJson(Map<String, dynamic> json) {
    profilePath = json['profile_path'];
    adult = json['adult'];
    id = json['id'];
    mediaType = json['media_type'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        if (v['media_type'] == 'movie') {
          knownFor!.add(Movie.fromJson(v));
        } else if (v['media_type'] == 'tv') {
          knownFor!.add(TVShow.fromJson(v));
        }
      });
    }
    name = json['name'];
    popularity = json['popularity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile_path'] = profilePath;
    data['adult'] = adult;
    data['id'] = id;
    data['media_type'] = mediaType;
    if (knownFor != null) {
      data['known_for'] = knownFor!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['popularity'] = popularity;
    return data;
  }
}

