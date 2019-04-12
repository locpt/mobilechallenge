import 'package:flutter/material.dart';
import 'package:mobilechallenge/blocs/application_bloc.dart';
import 'package:mobilechallenge/blocs/base/bloc_provider.dart';
import 'package:mobilechallenge/pages/home/home_bloc.dart';
import 'package:mobilechallenge/pages/home/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: ApplicationBloc(),
        child: BlocProvider(
            bloc: HomeBloc(),
            child: MaterialApp(
              title: "Home Page",
              home: Scaffold(
                appBar: AppBar(
                  title: Text("HomePage"),
                ),
                body: HomePage(),
              ),
            )));
  }
}
