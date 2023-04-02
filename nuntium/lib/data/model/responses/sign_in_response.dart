class SignInResponse {
  String? kind;
  String? localId;
  String? email;
  String? displayName;
  String? idToken;
  bool? registered;

  SignInResponse(
      {this.kind, this.localId, this.email, this.displayName, this.idToken, this.registered});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    localId = json['localId'];
    email = json['email'];
    displayName = json['displayName'];
    idToken = json['idToken'];
    registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['localId'] = localId;
    data['email'] = email;
    data['displayName'] = displayName;
    data['idToken'] = idToken;
    data['registered'] = registered;
    return data;
  }
}
