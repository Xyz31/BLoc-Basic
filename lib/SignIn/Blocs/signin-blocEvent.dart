import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitialEvent extends SignInEvent {}

class SignInEventTextChanged extends SignInEvent {
  final String emailValue;
  final String passwordValue;

  SignInEventTextChanged(this.emailValue, this.passwordValue);
}

class SignInEventSubmit extends SignInEvent {
  final String email;
  final String password;

  SignInEventSubmit(this.email, this.password);
}
