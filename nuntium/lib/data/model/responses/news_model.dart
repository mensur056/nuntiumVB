// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends Equatable {
  String? image;
  String? description;
  String? title;

  NewsModel({this.image, this.description, this.title});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return _$NewsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NewsModelToJson(this);
  }

  @override
  List<Object?> get props => [image, description, title];
}
