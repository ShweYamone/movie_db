import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/config/colors.dart';
import 'package:movie_db/provider/search_all_media_provider.dart';
import 'package:movie_db/ui/search/widgets/search_media_grid_widget.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  TextEditingController searchText = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('search page rebuilds');
    final searchMediaResultsState = ref.watch(searchAllMediaProvider);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48.h,
              color: AppColors.textFieldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 48.w,
                      child: const Icon(
                        Icons.search_sharp,
                        color: Colors.white70,
                      )),
                  Flexible(
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      maxLines: 1,
                      controller: searchText,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Search for a show, movie or people.',
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      onSubmitted: (String input) {
                        ref
                            .read(searchAllMediaProvider.notifier)
                            .queryHolder
                            .query = input;
                        ref
                            .read(searchAllMediaProvider.notifier)
                            .loadDataList();
                      },
                    ),
                  ),
                  Container(
                    width: 48.w,
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_voice,
                          color: Colors.white70,
                        )),
                  )
                ],
              ),
            ),
            searchMediaResultsState.when(
              data: (data) => SearchAllMediaGridWidget(
                mediaList: data,
              ),
              loading: () => const Text('Loading...'),
              error: (e, st) => const SizedBox(),
            ),
          ],
        ));
  }
}
