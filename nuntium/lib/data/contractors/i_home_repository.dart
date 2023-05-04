import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:nuntium/data/model/responses/category_model.dart';
import 'package:nuntium/presentation/global/failure.dart';
import '../model/responses/news_model.dart';

abstract class IHomeRepository {
  Future<Result<QuerySnapshot<NewsModel>, FailureGlobal>> fetchNews();

  Future<Result<List<CategoryModel>, FailureGlobal>> fetchCategory();
}
