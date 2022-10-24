import 'package:movie_db/config/config.dart';

class QueryHolder {
  String apiKey = Config.apiKey;
  int? page;
  String? query;
  String? language;
  bool? includeAdult;

  QueryHolder({this.page, this.query, this.language, this.includeAdult});

  QueryHolder.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    query = json['query'];
    language = json['language'];
    includeAdult = json['include_adult'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['api_key'] = apiKey;
    data['page'] = page;
    data['query'] = query;
    data['language'] = language;
    data['include_adult'] = includeAdult;
    return data;
  }
}
