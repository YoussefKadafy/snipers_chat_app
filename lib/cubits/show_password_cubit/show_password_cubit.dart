import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_password_state.dart';

class ShowPasswordCubit extends Cubit<ShowPasswordState> {
  ShowPasswordCubit() : super(ShowPasswordInitial(isPasswordShow: false));
  bool isShowPassword = true;

  void togglePassword() {
    isShowPassword = !isShowPassword;
    emit(ShowPasswordInitial(isPasswordShow: isShowPassword));
  }
}
