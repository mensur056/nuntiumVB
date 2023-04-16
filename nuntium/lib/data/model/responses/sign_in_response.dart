import 'package:json_annotation/json_annotation.dart';
part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  String? kind;
  String? localId;
  String? email;
  String? displayName;
  String? idToken;
  bool? registered;

  SignInResponse(
      {this.kind, this.localId, this.email, this.displayName, this.idToken, this.registered});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return _$SignInResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInResponseToJson(this);
  }
}
