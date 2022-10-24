import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_db/repository/all_media_repository.dart';
import 'package:movie_db/view_object/holder/query_holder.dart';
import 'package:movie_db/view_object/all_media_pagination.dart';

final searchAllMediaProvider = StateNotifierProvider.autoDispose<
    SearchAllMediaNotifier, AsyncValue<List<dynamic>>>((ref) {
  return SearchAllMediaNotifier(const AsyncValue.data([]));
  // ..loadDataList();
});

class SearchAllMediaNotifier extends StateNotifier<AsyncValue<List<dynamic>>> {
  SearchAllMediaNotifier(super.state);

  List<dynamic> allMediaList = [];
  bool noMoreItems = false;
  AllMediaRepository allMediaRepository = AllMediaRepository();
  QueryHolder queryHolder = QueryHolder(page: 1);

  // to control not to start loading
  // before next loading process is fully finised
  bool _isNextLoading = false;

  void updateData(AllMediaPagination pagination) {
    log('${queryHolder.page}');
    noMoreItems = (queryHolder.page == pagination.totalPages);
    if (queryHolder.page == 1) {
      allMediaList.clear();
    }
    allMediaList.addAll(pagination.results!);
    allMediaList = allMediaList.toSet().toList(); //to remove duplicates
    state = AsyncValue.data(allMediaList);
    queryHolder.page = queryHolder.page! + 1;
  }

  Future<void> loadDataList() async {
    queryHolder.page = 1;
    if (queryHolder.query == '') {
      state = const AsyncValue.data([]);
    } else {
      state = const AsyncLoading();
      try {
        final result = await allMediaRepository.searchAllMedia(queryHolder);
        updateData(result);
      } catch (e) {
        state = AsyncError(e);
        log(e.toString().replaceAll('Exception: ', ''));
      }
    }
  }

  Future<void> loadNextDataList() async {
    if (!noMoreItems && !_isNextLoading) {
      _isNextLoading = true;
      try {
        final result = await allMediaRepository.searchAllMedia(queryHolder);
        updateData(result);
      } catch (e) {
        log(e.toString().replaceAll('Exception: ', ''));
        _isNextLoading = false;
      }
    }
    _isNextLoading = false;
  }
}
