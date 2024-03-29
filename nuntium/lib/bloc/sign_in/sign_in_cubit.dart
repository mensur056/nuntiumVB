import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/data/contractors/i_auth_repository.dart';

import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._authRepository) : super(SignInInitial());
  final IAuthRepository _authRepository;

  Future<void> signIn(String email, String password) async {
    emit(SignInInProgress());
    final result = await _authRepository.signIn(email, password);
    if (result.isSuccess()) {
      emit(SignInSuccess());
    } else if (result.isError()) {
      emit(SignInFailure());
    }
  }
}
