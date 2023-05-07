import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tag_model.g.dart';

@JsonSerializable()
class TagModel extends Equatable {
  String? name;
  bool? isactive;

  TagModel({this.name, this.isactive});

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return _$TagModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TagModelToJson(this);
  }

  @override
  List<Object?> get props => [name, isactive];
}
