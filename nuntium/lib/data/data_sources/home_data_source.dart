import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nuntium/data/model/responses/category_model.dart';
import 'package:nuntium/data/model/responses/tag_model.dart';
import '../../utility/firebase/firebase_collection.dart';
import '../model/responses/news_model.dart';

class HomeDataSource {
  Future<List<NewsModel>?> fetchNewsItem() async {
    CollectionReference news = FirebaseCollection.news.referance;
    final response = await news.withConverter<NewsModel>(
      fromFirestore: (snapshot, options) {
        return NewsModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        if (value == null) throw Exception();
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }

  Future<List<TagModel>?> fetchTagItem() async {
    CollectionReference news = FirebaseCollection.tag.referance;
    final response = await news.withConverter<TagModel>(
      fromFirestore: (snapshot, options) {
        return TagModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        if (value == null) throw Exception();
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }

  Future<List<CategoryModel>?> fetchCategoryItem() async {
    CollectionReference news = FirebaseCollection.category.referance;
    final response = await news.withConverter<CategoryModel>(
      fromFirestore: (snapshot, options) {
        return CategoryModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        if (value == null) throw Exception();
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }
}
