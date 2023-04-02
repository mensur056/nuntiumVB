import 'package:multiple_result/multiple_result.dart';
import 'package:nuntium/data/contractors/i_auth_repository.dart';
import 'package:nuntium/data/data_sources/auth_data_source.dart';
import 'package:nuntium/presentation/global/failure.dart';
import 'package:nuntium/data/model/responses/user_token_model.dart';

import '../../locator/locator.dart';

class ImplAuthrepository implements IAuthRepository {
  final _authDataSource = getIt.get<AuthDataSource>();
  @override
  Future<Result<UserTokenModel, FailureGlobal>> signIn(String email, String password) async {
    try {
      final result = await _authDataSource.signIn(email, password);
    } catch (e) {}
  }
}
