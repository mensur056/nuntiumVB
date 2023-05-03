import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nuntium/data/model/responses/category_model.dart';
import '../model/responses/news_model.dart';

class HomeDataSource {
  Future<QuerySnapshot<NewsModel>> fetchAllItemFromDatabase() async {
    CollectionReference news = FirebaseFirestore.instance.collection("news");
    final response = await news.withConverter<NewsModel>(
      fromFirestore: (snapshot, options) {
        return NewsModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        if (value == null) throw Exception();
        return value.toJson();
      },
    ).get();
    return response;
  }

  Future<QuerySnapshot<CategoryModel>> fetchCategoryItem() async {
    CollectionReference news = FirebaseFirestore.instance.collection("category");
    final response = await news.withConverter<CategoryModel>(
      fromFirestore: (snapshot, options) {
        return CategoryModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        if (value == null) throw Exception();
        return value.toJson();
      },
    ).get();
    return response;
  }
}
