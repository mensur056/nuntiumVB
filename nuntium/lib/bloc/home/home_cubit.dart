import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/data/contractors/i_home_repository.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeInitial());
  final IHomeRepository _homeRepository;

  Future<void> fetchNewsItem() async {
    emit(HomeInProgress());
    final newsResult = await _homeRepository.fetchNews();
    final tagResult = await _homeRepository.fetchTag();

    if (newsResult.isSuccess() && tagResult.isSuccess()) {
      final homeNewsResult = newsResult.tryGetSuccess();
      final homeTagResult = tagResult.tryGetSuccess();

      emit(HomeSuccess(newsItems: homeNewsResult, tagItems: homeTagResult));
    } else {
      emit(HomeFailure('There is Error'));
    }
  }
}
