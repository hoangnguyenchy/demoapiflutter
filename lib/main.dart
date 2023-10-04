import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/LoginPage.dart';
import 'Login/LoginBloc.dart';
import 'HomePage/HomePageBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();
    final homePageBloc = HomePageBloc();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => loginBloc,
          ),
          BlocProvider<HomePageBloc>(
            create: (context) => homePageBloc,
          ),
        ],
        child: LoginPage(),
      ),
    );
  }
}
