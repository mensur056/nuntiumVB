// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nuntium/data/model/responses/news_model.dart';
import 'package:nuntium/data/model/responses/tag_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeInProgress extends HomeState {}

class HomeSuccess extends HomeState {
  final List<NewsModel>? newsItems;
  final List<TagModel>? tagItems;
  HomeSuccess({this.newsItems, this.tagItems});

  HomeSuccess copyWith({
    List<NewsModel>? newsItems,
    List<TagModel>? tagItems,
  }) {
    return HomeSuccess(
      newsItems: newsItems ?? this.newsItems,
      tagItems: tagItems ?? this.tagItems,
    );
  }
}

class HomeFailure extends HomeState {
  final String messsage;
  HomeFailure(this.messsage);
}
