import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/data/contractors/i_auth_repository.dart';

import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepository) : super(SignUpInitial());
  final IAuthRepository _authRepository;

  Future<void> signUp(String email, String password) async {
    emit(SignUpInProgress());
    final result = await _authRepository.signUp(email, password);
    if (result.isSuccess()) {
      emit(SignUpSuccess());
    } else if (result.isError()) {
      emit(SignUpFailure());
    }
  }
}
