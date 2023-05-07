import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/data/contractors/i_home_repository.dart';

import 'home_detail_state.dart';

class HomeDetailCubit extends Cubit<HomeDetailState> {
  HomeDetailCubit(this._homeRepository) : super(HomeDetailInitial());
  final IHomeRepository _homeRepository;
  Future<void> fetchCategoryItem() async {
    emit(HomeDetailInProgress());
    final result = await _homeRepository.fetchCategory();
    if (result.isSuccess()) {
      final homeResult = result.tryGetSuccess();
      emit(HomeDetailSuccess(homeResult!));
    } else {
      emit(HomeDetailFailure('There is Error'));
    }
  }
}
