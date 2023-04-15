import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:nuntium/presentation/global/failure.dart';
import '../model/responses/news_model.dart';

abstract class IHomeRepository {
  Future<Result<QuerySnapshot<NewsModel>, FailureGlobal>> fetchNews();
}
