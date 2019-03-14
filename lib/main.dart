import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobilechallenge/redux/actions.dart';
import 'package:mobilechallenge/redux/reducers.dart';
import 'package:mobilechallenge/model/model.dart';
import 'redux/middleware.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducers,
      initialState: AppState.initialState(),
      middleware: [appStateMiddleware],
    );

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: "Horizontal ListView",
          home: new Scaffold(
            appBar: new AppBar(
              title: Text("Horizontal ListView"),
            ),
            body: StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(GetItemsAction()),
              builder: (BuildContext context, Store<AppState> store) => HomePage(store),
            ),
          )),
    );
  }
}
