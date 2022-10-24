import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/config/config.dart';
import 'package:movie_db/provider/search_all_media_provider.dart';
import 'package:movie_db/ui/shimmer_item.dart';

class SearchAllMediaGridWidget extends ConsumerWidget {
  final List? mediaList;
  SearchAllMediaGridWidget({Key? key, required this.mediaList})
      : super(key: key);

  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.read(searchAllMediaProvider.notifier).loadNextDataList();
      }
    });
    return Flexible(
      child: GridView.builder(
          controller: _scrollController,
          padding: EdgeInsets.all(6.w),
          itemCount: mediaList?.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 140,
              childAspectRatio: 0.68,
              crossAxisSpacing: 6.w,
              mainAxisSpacing: 6.h),
          itemBuilder: (BuildContext ctx, index) {
            return SearchMediaItem(
              media: mediaList?[index],
              isLoading: false,
            );
          }),
    );
  }
}

class SearchMediaItem extends StatelessWidget {
  final dynamic media;
  final bool isLoading;

  const SearchMediaItem({Key? key, required this.media, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: EdgeInsets.only(right: 8.w),
      width: 0.3.sw,
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
                  imageUrl: '${Config.imageUploadUrl}${media.posterPath}',
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
    );
  }
}
