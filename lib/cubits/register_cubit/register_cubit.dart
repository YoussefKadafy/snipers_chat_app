import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> getUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'Email already in use'));
      } else if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'weak password'));
      } else {
        emit(RegisterFailure(errMessage: 'somthing went wrong'));
      }
    }
  }
}
