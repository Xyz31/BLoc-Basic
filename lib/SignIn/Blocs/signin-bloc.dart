import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocEvent.dart';
import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocSatates.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInStates> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInInitialEvent>((event, emit) => emit(SignInInitialState()));
    on<SignInEventTextChanged>((event, emit) => {
          if (EmailValidator.validate(event.emailValue) == false)
            {emit(SignInErrorState('Enter a valid mail'))}
          else if (event.passwordValue.length < 6)
            {emit(SignInErrorState('invalid password'))}
          else
            {emit(SignInValidState())}
        });

    on<SignInEventSubmit>((event, emit) => emit(SignInLoadingState()));
  }
}
