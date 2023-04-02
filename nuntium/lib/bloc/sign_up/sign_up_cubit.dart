import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/data/contractors/i_auth_repository.dart';

import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepository) : super(SignUpInitial());
  final IAuthRepository _authRepository;
}
