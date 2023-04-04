import 'package:multiple_result/multiple_result.dart';
import 'package:nuntium/data/contractors/i_auth_repository.dart';
import 'package:nuntium/data/data_sources/auth_data_source.dart';
import 'package:nuntium/data/model/responses/sign_up_response.dart';
import 'package:nuntium/presentation/global/failure.dart';
import 'package:nuntium/data/model/responses/sign_in_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../locator/locator.dart';

class ImplAuthRepository implements IAuthRepository {
  final _authDataSource = getIt.get<AuthDataSource>();
  @override
  Future<Result<SignInResponse, FailureGlobal>> signIn(String email, String password) async {
    try {
      final result = await _authDataSource.signIn(email, password);
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setBool('logged', true);
      return Success(result!);
    } catch (e) {
      return Error(FailureGlobal(e.toString()));
    }
  }

  @override
  Future<Result<SignUpResponse, FailureGlobal>> signUp(String email, String password) async {
    try {
      final result = await _authDataSource.signUp(email, password);
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setBool('logged', true);
      return Success(result!);
    } catch (e) {
      return Error(FailureGlobal(e.toString()));
    }
  }

  @override
  Future<Result<bool, FailureGlobal>> checkAuth() async {
    try {
      final isAuthenticated = await _authDataSource.isAuthenticated();
      return Success(isAuthenticated ?? false);
    } catch (e) {
      return Error(FailureGlobal(e.toString()));
    }
  }
}
