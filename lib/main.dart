import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petruk/bloc/bloc_delegate.dart';
import 'package:petruk/bloc/home/home_bloc.dart';
import 'package:petruk/bloc/main/bloc.dart';
import 'package:petruk/page/welcome_page.dart';

Future<Null> main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  HomeBloc homeBloc;
  MainBloc mainBloc;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    homeBloc = HomeBloc();
    mainBloc = MainBloc();

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          builder: (context) => homeBloc,
        ),
        BlocProvider<MainBloc>(
          builder: (context) => mainBloc,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(child: WelcomePage()),
      ),
    );
  }
}