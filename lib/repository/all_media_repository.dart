
import 'package:movie_db/api/api_service.dart';
import 'package:movie_db/config/config.dart';
import 'package:movie_db/view_object/all_media_pagination.dart';
import 'package:movie_db/view_object/holder/query_holder.dart';

class AllMediaRepository extends ApiService {
  Future<AllMediaPagination> searchAllMedia(QueryHolder queryHolder) async {
    String endpoint = "/search/multi";
    String url =
        '${Config.coreUrl}$endpoint?api_key=${Config.apiKey}&page=${queryHolder.page}&language=${queryHolder.language}&query=${queryHolder.query ?? 'millie'}';
    return getData(
        url: url, builder: (data) => AllMediaPagination.fromJson(data));

    // if (response.statusCode == 200) {
    //   final body = json.decode(response.body);
    //   AllMediaPagination allMediaPagination = AllMediaPagination.fromJson(body);
    //   return allMediaPagination;
    // } else {
    //   final body = json.decode(response.body);
    //   ApiResponse apiResponse = ApiResponse.fromJson(body);
    //   log('${apiResponse.statusMessage}');
    //   throw Exception(apiResponse.statusMessage);
    // }
  }
}
