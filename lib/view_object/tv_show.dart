

class TVShow {
  String? posterPath;
  num? popularity;
  int? id;
  String? overview;
  String? backdropPath;
  num? voteAverage;
  String? mediaType;
  String? firstAirDate;
  List<String>? originCountry;
  List<int>? genreIds;
  String? originalLanguage;
  num? voteCount;
  String? name;
  String? originalName;

  TVShow(
      {this.posterPath,
      this.popularity,
      this.id,
      this.overview,
      this.backdropPath,
      this.voteAverage,
      this.mediaType,
      this.firstAirDate,
      this.originCountry,
      this.genreIds,
      this.originalLanguage,
      this.voteCount,
      this.name,
      this.originalName});

  @override
  bool operator ==(other) => other is TVShow && id == other.id;

  @override
  int get hashCode => id.hashCode;    

  TVShow.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    popularity = json['popularity'];
    id = json['id'];
    overview = json['overview'];
    backdropPath = json['backdrop_path'];
    voteAverage = json['vote_average'];
    mediaType = json['media_type'];
    firstAirDate = json['first_air_date'];
    originCountry = json['origin_country'].cast<String>();
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    voteCount = json['vote_count'];
    name = json['name'];
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['poster_path'] = posterPath;
    data['popularity'] = popularity;
    data['id'] = id;
    data['overview'] = overview;
    data['backdrop_path'] = backdropPath;
    data['vote_average'] = voteAverage;
    data['media_type'] = mediaType;
    data['first_air_date'] = firstAirDate;
    data['origin_country'] = originCountry;
    data['genre_ids'] = genreIds;
    data['original_language'] = originalLanguage;
    data['vote_count'] = voteCount;
    data['name'] = name;
    data['original_name'] = originalName;
    return data;
  }
}
