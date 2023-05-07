import 'package:nuntium/data/model/responses/category_model.dart';

abstract class HomeDetailState {}

class HomeDetailInitial extends HomeDetailState {}

class HomeDetailSuccess extends HomeDetailState {
  final List<CategoryModel> items;

  HomeDetailSuccess(this.items);
}

class HomeDetailInProgress extends HomeDetailState {}

class HomeDetailFailure extends HomeDetailState {
  final String messsage;

  HomeDetailFailure(this.messsage);
}
