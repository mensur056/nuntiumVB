import 'package:nuntium/data/data_sources/dio_configuration.dart';
import 'package:nuntium/data/model/requests/user_model.dart';
import 'package:nuntium/data/model/responses/user_token_model.dart';
import 'package:nuntium/keys.dart';

class AuthDataSource {
  Future<UserTokenModel?> signIn(String email, String password) async {
    final signInBody = UserModel(email: email, password: password).toJson();
    final response = await dio.post(signInUrl, data: signInBody);

    if (response.statusCode != null) {
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final signInResponse = UserTokenModel.fromJson(response.data);
        return signInResponse;
      }
    }
    return null;
  }
}
