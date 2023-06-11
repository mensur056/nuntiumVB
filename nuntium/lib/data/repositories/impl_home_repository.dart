import 'package:multiple_result/multiple_result.dart';
import 'package:nuntium/data/contractors/i_home_repository.dart';
import 'package:nuntium/data/data_sources/home_data_source.dart';
import 'package:nuntium/data/model/responses/category_model.dart';
import 'package:nuntium/data/model/responses/tag_model.dart';
import 'package:nuntium/presentation/global/failure.dart';
import 'package:nuntium/data/model/responses/news_model.dart';

import '../../locator/injection.dart';

class ImplHomeRepository extends IHomeRepository {
  final _homeDataSource = getIt.get<HomeDataSource>();
  @override
  Future<Result<List<NewsModel>, FailureGlobal>> fetchNews() async {
    try {
      final result = await _homeDataSource.fetchNewsItem();
      return Success(result!);
    } catch (e) {
      return Error(FailureGlobal('Error'));
    }
  }

  @override
  Future<Result<List<CategoryModel>, FailureGlobal>> fetchCategory() async {
    try {
      final result = await _homeDataSource.fetchCategoryItem();
      return Success(result!);
    } catch (e) {
      return Error(FailureGlobal('Error'));
    }
  }

  @override
  Future<Result<List<TagModel>, FailureGlobal>> fetchTag() async {
    try {
      final result = await _homeDataSource.fetchTagItem();
      return Success(result!);
    } catch (e) {
      return Error(FailureGlobal('Error'));
    }
  }
}
