import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nuntium/data/model/responses/category_model.dart';

abstract class HomeDetailState {}

class HomeDetailInitial extends HomeDetailState {}

class HomeDetailSuccess extends HomeDetailState {
  final QuerySnapshot<CategoryModel> items;

  HomeDetailSuccess(this.items);
}

class HomeDetailInProgress extends HomeDetailState {}

class HomeDetailFailure extends HomeDetailState {
  final String messsage;

  HomeDetailFailure(this.messsage);
}
