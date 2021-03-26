import 'package:flutter/material.dart';
import 'package:flutter_app/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

    final store = Store<AppState>(counterReducer, initialState: AppState.initialState());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store, //绑定store
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<AppState, String>(builder: (context, value) {
              return Text(
                '$value',
                style: Theme.of(context).textTheme.headline4,
              );
            }, converter: (Store store) {
              return store.state.count.toString();
            }),
          ],
        ),
      ),
        floatingActionButton: StoreConnector<AppState, VoidCallback>(
          converter: (Store store) {
            return () => store.dispatch(IncrementAction(payload: 1)); //发送数据
          },
          builder: (BuildContext context, VoidCallback callback) {
            return FloatingActionButton(
                onPressed: callback, child: Icon(Icons.add));
          },
        ),
    );
  }
}
