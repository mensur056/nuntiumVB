// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

// ignore: must_be_immutable
@JsonSerializable()
class UserModel extends Equatable {
  String? email;
  String? password;

  UserModel({this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }

  @override
  List<Object?> get props => [email, password];
}
