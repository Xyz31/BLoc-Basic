import 'package:bloc3_form_validate/SignIn/Blocs/signin-bloc.dart';
import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocEvent.dart';
import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocSatates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignWithEmail extends StatelessWidget {
  TextEditingController _textController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  SignWithEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SignInBloc, SignInStates>(
                bloc: SignInBloc(),
                builder: (_, state) {
                  if (state is SignInError) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _textController,
                onChanged: (val) {
                  /*
                      BlocProvider.of<SignInEmailBloc>(context).add(
                          SignInEventTextChanged(_textController.toString(),
                              _passwordController.toString()));
                              */
                  // Use context.read to directly access the SignInEmailBloc instance
                  /*
                      context.read<SignInBloc>().add(
                            SignInEventTextChanged(
                              _textController
                                  .text, // Use text property to get the current text
                              _passwordController.text,
                            ),
                          );
                        */
                },
                style: const TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 14.0, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                  fontStyle: FontStyle.italic, // Font style
                ),
                decoration: InputDecoration(
                  labelText:
                      'Enter your Email', // Label when the field is empty
                  // Hint text when the field is empty
                  prefixIcon: const Icon(Icons.person), // Icon before the text
                  border: OutlineInputBorder(
                    // Rounded border
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue), // Border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Rounded border when focused
                    borderRadius: BorderRadius.circular(10.0),

                    borderSide: const BorderSide(
                        width: 2,
                        color: Colors.black), // Border color when focused
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _passwordController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInEventTextChanged(
                          _textController.text, _passwordController.text));

                  // Use context.read to directly access the SignInEmailBloc instance
                  /*
                      context.read<SignInBloc>().add(
                            SignInEventTextChanged(
                              _textController
                                  .text, // Use text property to get the current text
                              _passwordController.text,
                            ),
                          );
                          */
                },
                style: const TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 14.0, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                  fontStyle: FontStyle.italic, // Font style
                ),
                decoration: InputDecoration(
                  labelText:
                      'Enter your password', // Label when the field is empty
                  // Hint text when the field is empty
                  prefixIcon: const Icon(Icons.person), // Icon before the text
                  border: OutlineInputBorder(
                    // Rounded border
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue), // Border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Rounded border when focused
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        width: 2,
                        color: Colors.black), // Border color when focused
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<SignInBloc, SignInStates>(
                builder: (context, state) {
                  return CupertinoButton(
                      onPressed: () {},
                      color:
                          (state is SignInInvalid) ? Colors.blue : Colors.grey,
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 20),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
