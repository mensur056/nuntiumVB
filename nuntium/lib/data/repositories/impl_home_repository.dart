import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:nuntium/data/contractors/i_home_repository.dart';
import 'package:nuntium/data/data_sources/home_data_source.dart';
import 'package:nuntium/presentation/global/failure.dart';
import 'package:nuntium/data/model/responses/news_model.dart';

import '../../locator/locator.dart';

class ImplHomeRepository extends IHomeRepository {
  final _homeDataSource = getIt.get<HomeDataSource>();
  @override
  Future<Result<QuerySnapshot<NewsModel>, FailureGlobal>> fetchNews() async {
    try {
      final result = await _homeDataSource.fetchAllItemFromDatabase();
      return Success(result);
    } catch (e) {
      return Error(FailureGlobal('Error'));
    }
  }
}
