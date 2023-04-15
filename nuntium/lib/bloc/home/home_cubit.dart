import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/data/contractors/i_home_repository.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeInitial());
  final IHomeRepository _homeRepository;

  Future<void> fetchNewsItem() async {
    emit(HomeInProgress());
    final result = await _homeRepository.fetchNews();
    if (result.isSuccess()) {
      emit(HomeSuccess());
    } else {
      emit(HomeFailure('There is Error'));
    }
  }
}
