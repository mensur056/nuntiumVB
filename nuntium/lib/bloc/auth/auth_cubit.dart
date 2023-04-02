import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuntium/data/contractors/i_auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthState.initial);
  final IAuthRepository _authRepository;
  Future<void> checkAuth() async {
    final result = await _authRepository.checkAuth();
    await Future.delayed(const Duration(seconds: 4));
    if (result.isSuccess()) {
      final isAuthenticated = result.tryGetSuccess()!;
      emit(isAuthenticated ? AuthState.authenticated : AuthState.unauthenticated);
    } else if (result.isError()) {
      emit(AuthState.unauthenticated);
    }
  }
}
