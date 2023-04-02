class UserTokenModel {
  String? kind;
  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  UserTokenModel(
      {this.kind, this.idToken, this.email, this.refreshToken, this.expiresIn, this.localId});

  UserTokenModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    idToken = json['idToken'];
    email = json['email'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
    localId = json['localId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['idToken'] = idToken;
    data['email'] = email;
    data['refreshToken'] = refreshToken;
    data['expiresIn'] = expiresIn;
    data['localId'] = localId;
    return data;
  }
}
