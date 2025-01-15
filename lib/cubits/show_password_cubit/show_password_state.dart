part of 'show_password_cubit.dart';

@immutable
abstract class ShowPasswordState {}

class ShowPasswordInitial extends ShowPasswordState {
  bool isPasswordShow;
  ShowPasswordInitial({required this.isPasswordShow});
}
