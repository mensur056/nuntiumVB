import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nuntium/data/model/responses/news_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeInProgress extends HomeState {}

class HomeSuccess extends HomeState {
  final QuerySnapshot<NewsModel> items;
  HomeSuccess(this.items);
}

class HomeFailure extends HomeState {
  final String messsage;
  HomeFailure(this.messsage);
}
