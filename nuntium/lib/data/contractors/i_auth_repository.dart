import 'package:multiple_result/multiple_result.dart';
import 'package:nuntium/data/model/responses/sign_in_response.dart';
import 'package:nuntium/data/model/responses/sign_up_response.dart';
import 'package:nuntium/presentation/global/failure.dart';

abstract class IAuthRepository {
  Future<Result<SignInResponse, FailureGlobal>> signIn(String email, String password);
  Future<Result<SignUpResponse, FailureGlobal>> signUp(String email, String password);
  Future<Result<bool, FailureGlobal>> checkAuth();
}
