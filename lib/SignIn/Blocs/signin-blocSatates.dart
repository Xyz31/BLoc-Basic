import 'package:equatable/equatable.dart';

abstract class SignInStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInStates {}

class SignInInvalid extends SignInStates {}

class SignInValid extends SignInStates {}

class SignInError extends SignInStates {
  final String errorMessage;

  SignInError(this.errorMessage);
}

class SignInLoading extends SignInStates {}
