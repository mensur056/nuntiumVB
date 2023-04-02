import 'package:nuntium/data/data_sources/dio_configuration.dart';
import 'package:nuntium/data/model/requests/user_model.dart';
import 'package:nuntium/data/model/responses/sign_in_response.dart';
import 'package:nuntium/data/model/responses/sign_up_response.dart';
import 'package:nuntium/keys.dart';

class AuthDataSource {
  Future<SignInResponse?> signIn(String email, String password) async {
    final signInBody = UserModel(email: email, password: password).toJson();
    final response = await dio.post(signInUrl, data: signInBody);

    if (response.statusCode != null) {
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final signInResponse = SignInResponse.fromJson(response.data);
        return signInResponse;
      }
    }
    return null;
  }

  Future<SignUpResponse?> signUp(String email, String password) async {
    final signInBody = UserModel(email: email, password: password).toJson();
    final response = await dio.post(signUpUrl, data: signInBody);

    if (response.statusCode != null) {
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final signInResponse = SignUpResponse.fromJson(response.data);
        return signInResponse;
      }
    }
    return null;
  }
}
