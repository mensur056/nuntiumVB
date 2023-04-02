import 'package:multiple_result/multiple_result.dart';
import 'package:nuntium/data/model/responses/user_token_model.dart';
import 'package:nuntium/presentation/global/failure.dart';

abstract class IAuthRepository {
  Future<Result<UserTokenModel, FailureGlobal>> signIn(String email, String password);
}
