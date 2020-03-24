import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:petruk/bloc/bloc_delegate.dart';
import 'package:petruk/page/welcome_page.dart';

Future<Null> main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: WelcomePage()),
    );
  }
}