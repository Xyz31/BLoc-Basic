import 'package:bloc3_form_validate/SignIn/Blocs/signin-bloc.dart';
import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocEvent.dart';
import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocSatates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignWithEmail extends StatefulWidget {
  const SignWithEmail({
    super.key,
  });

  @override
  State<SignWithEmail> createState() => _SignWithEmailState();
}

class _SignWithEmailState extends State<SignWithEmail> {
  final TextEditingController _textController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
        //BlocProvider<SignInBloc>(
        // create: (context) => SignInBloc(),
        //child:
        Scaffold(
      appBar: AppBar(),
      body:
          // BlocProvider<SignInBloc>(
          //   create: (context) => SignInBloc(),
          //   child:
          Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SignInBloc, SignInStates>(
              //bloc: SignInBloc(),
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
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
                BlocProvider.of<SignInBloc>(context).add(SignInEventTextChanged(
                    _textController.text, _passwordController.text));

                // Use context.read to directly access the SignInEmailBloc instance
              },
              style: const TextStyle(
                color: Colors.black, // Text color
                fontSize: 14.0, // Font size
                fontWeight: FontWeight.bold, // Font weight
                fontStyle: FontStyle.italic, // Font style
              ),
              decoration: InputDecoration(
                labelText: 'Enter your Email', // Label when the field is empty
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
                BlocProvider.of<SignInBloc>(context).add(SignInEventTextChanged(
                    _textController.text, _passwordController.text));

                // Use context.read to directly access the SignInEmailBloc instance
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
                if (state is SignInLoadingState) {
                  return const CircularProgressIndicator();
                }
                return CupertinoButton(
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInEventSubmit(_textController.text,
                                _passwordController.text));
                      }
                    },
                    color:
                        (state is SignInValidState) ? Colors.blue : Colors.grey,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
