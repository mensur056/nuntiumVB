import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  String? name;
  String? detail;

  CategoryModel({this.name, this.detail});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(this);
  }

  @override
  List<Object?> get props => [name, detail];
}
