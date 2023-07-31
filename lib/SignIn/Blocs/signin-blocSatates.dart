import 'package:equatable/equatable.dart';

abstract class SignInStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInInitialState extends SignInStates {}

class SignInInvalidState extends SignInStates {}

class SignInValidState extends SignInStates {}

class SignInErrorState extends SignInStates {
  final String errorMessage;
  SignInErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {
  final String userId;
  SignInSuccessState(this.userId);

  @override
  List<Object?> get props => [userId];
}
