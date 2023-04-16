import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  String? kind;
  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  SignUpResponse(
      {this.kind, this.idToken, this.email, this.refreshToken, this.expiresIn, this.localId});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpResponseToJson(this);
  }
}
