import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMessage: 'Wrong password'));
      } else if (e.code == 'invalid-email') {
        emit(LoginFailure(errMessage: 'Invalid email address'));
      } else if (e.code == 'too-many-requests') {
        emit(LoginFailure(errMessage: 'Too many requests. Try again later'));
      } else {
        emit(LoginFailure(
            errMessage: 'Something went wrong: ${e.message},   ${e.code}'));
      }
    } catch (e) {
      // Catch any unexpected errors
      print('Unexpected error: $e');
      emit(LoginFailure(errMessage: 'An unexpected error occurred'));
    }
  }
}
