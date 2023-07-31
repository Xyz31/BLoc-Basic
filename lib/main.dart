import 'package:bloc3_form_validate/SignIn/Blocs/signin-bloc.dart';
import 'package:bloc3_form_validate/SignIn/Blocs/signin-blocSatates.dart';
import 'package:bloc3_form_validate/SignIn/utils/signEmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Raleway'),
        home: //MyHomePage(title: 'Bloc Form Validation')
            BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(),
          child: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(children: [
          // BlocProvider<SignInBloc>(
          //   create: (context) => SignInBloc(),
          //   child:
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignWithEmail()),
              );
            },
            child: Text(
              'Sign In Email',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ]));
  }
}
