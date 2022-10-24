import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/config/config.dart';
import 'package:movie_db/ui/shimmer_item.dart';
import 'package:movie_db/view_object/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieListWidget extends StatelessWidget {
  final List? movies;
  final bool isLoading;
  final String? title;
  const MovieListWidget(
      {Key? key, this.title, this.movies, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    if (isLoading == true) {
      count = 3;
    } else {
      count = movies!.length;
    }
    return Container(
      margin: EdgeInsets.only(
        left: 8.w,
        top: 4.h,
        bottom: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 6.h),
          SizedBox(
            height: 148.h,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return MovieListItem(
                    movie: isLoading ? Movie() : movies![index],
                    isLoading: isLoading,
                  );
                },
                itemCount: count),
          ),
        ],
      ),
    );
  }
}

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final bool isLoading;
  const MovieListItem({Key? key, required this.movie, this.isLoading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      width: 0.28.sw,
      child: isLoading
          ? const ShimmerItem()
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 0),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => const ShimmerItem(),
                  imageUrl: '${Config.imageUploadUrl}${movie.posterPath}',
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
    );
  }
}
