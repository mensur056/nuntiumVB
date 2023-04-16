import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
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
}
