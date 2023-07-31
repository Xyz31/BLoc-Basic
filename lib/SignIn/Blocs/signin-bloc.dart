import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocEvent.dart';
import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocSatates.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
class SignInEmailBloc extends Bloc<SignInEvent, SignInStates> {
  SignInEmailBloc() : super(SignInInitial()) {
    on<SignInEventTextChanged>((event, emit) => {
          if (event.emailValue == '' &&
              EmailValidator.validate(event.emailValue))
            {emit(SignInError('Enter a valid mail'))}
          else if (event.passwordValue.length < 6)
            {emit(SignInError('invalid password'))}
          else
            {emit(SignInValid())}
        });

    on<SignInEventSubmit>((event, emit) => emit(SignInLoading()));
  }
}
*/
import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocEvent.dart';
import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocSatates.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInStates> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEventTextChanged>((event, emit) {
      if (event.emailValue.isNotEmpty &&
          !EmailValidator.validate(event.emailValue)) {
        emit(SignInError('Enter a valid email'));
      } else if (event.passwordValue.length < 6) {
        emit(SignInError('Invalid password'));
      } else {
        emit(SignInValid());
      }
    });

    on<SignInEventSubmit>((event, emit) => emit(SignInLoading()));
  }
}
