import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/config/colors.dart';
import 'package:movie_db/config/route_path.dart';
import 'package:movie_db/provider/movie_provider.dart';
import 'package:movie_db/ui/home/widgets/movie_list_widget.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMovies = ref.watch(popularMoviesProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upcomingMoviesProvider);
    log('home page rebuilds');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        title: Icon(Icons.slow_motion_video_sharp, color: AppColors.mainColor,size: 56,),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () =>
                  Navigator.pushNamed(context, RoutePaths.toSearchList))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(popularMoviesProvider);
          ref.refresh(nowPlayingMoviesProvider);
          ref.refresh(topRatedMoviesProvider);
          ref.refresh(upcomingMoviesProvider);
        },
        child: ListView(
          children: <Widget>[
            popularMovies.when(
              data: (data) => MovieListWidget(
                  title: 'What\'s Popular', movies: data.results),
              loading: () => const MovieListWidget(
                isLoading: true,
              ),
              error: (e, st) => Text(e.toString()),
            ),
            topRatedMovies.when(
              data: (data) => MovieListWidget(
                  title: 'Top Rated Movies', movies: data?.results),
              loading: () => const MovieListWidget(
                isLoading: true,
              ),
              error: (e, st) => const SizedBox(),
            ),
            nowPlayingMovies.when(
              data: (data) => MovieListWidget(
                  title: 'Now Playing Movies', movies: data?.results),
              loading: () => const MovieListWidget(
                isLoading: true,
              ),
              error: (e, st) => const SizedBox(),
            ),
            upComingMovies.when(
              data: (data) => MovieListWidget(
                  title: 'UpComing Movies', movies: data?.results),
              loading: () => const MovieListWidget(
                isLoading: true,
              ),
              error: (e, st) => const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
