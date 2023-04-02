import 'package:multiple_result/multiple_result.dart';
import 'package:nuntium/data/contractors/i_auth_repository.dart';
import 'package:nuntium/data/data_sources/auth_data_source.dart';
import 'package:nuntium/data/model/responses/sign_up_response.dart';
import 'package:nuntium/presentation/global/failure.dart';
import 'package:nuntium/data/model/responses/sign_in_response.dart';

import '../../locator/locator.dart';

class ImplAuthrepository implements IAuthRepository {
  final _authDataSource = getIt.get<AuthDataSource>();
  @override
  Future<Result<SignInResponse, FailureGlobal>> signIn(String email, String password) async {
    try {
      final result = await _authDataSource.signIn(email, password);
      return Success(result!);
    } catch (e) {
      return Error(FailureGlobal(e.toString()));
    }
  }

  @override
  Future<Result<SignUpResponse, FailureGlobal>> signUp(String email, String password) async {
    try {
      final result = await _authDataSource.signUp(email, password);
      return Success(result!);
    } catch (e) {
      return Error(FailureGlobal(e.toString()));
    }
  }
}
