import 'package:flutter/material.dart';
import 'package:movie_db/config/route_path.dart';
import 'package:movie_db/ui/home/home_page.dart';
import 'package:movie_db/ui/search/search_all_media_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return const MyHomePage();
      });

    case RoutePaths.toSearchList:
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return const SearchPage();
      });

    default:
      return PageRouteBuilder<dynamic>(
          pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
              const MyHomePage());
  }
}
