import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:movie_db/view_object/api_response.dart';

abstract class ApiService {
  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await get(uri);
      final data = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          return builder(data);
        default:
          ApiResponse apiResponse = ApiResponse.fromJson(data);
          log('${apiResponse.statusMessage}');
          throw Exception(apiResponse.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
