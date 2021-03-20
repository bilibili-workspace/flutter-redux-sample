import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';
import 'home_store.dart';

void main() {
  runApp(FlutterReduxApp());
}

class FlutterReduxApp extends StatelessWidget {
  //步骤4 申明一个store,必须传入一个方法进去，其余的参数选填，这里选择初始化一下基础参数
  final store = Store<AppState>(counterReducer, initialState: AppState.initialState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store, //绑定store
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text("Title"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("You have pushed the button this many times:"),
                  //当需要使用到共享数据的时候使用StoreConnector来获取数据
                  StoreConnector<AppState, String>(builder: (context, value) {
                    return Text(value, style: Theme.of(context).textTheme.display1);
                  }, converter: (Store store) {
                    return store.state.count.toString();
                  })
                ],
              ),
            ),
            floatingActionButton: StoreConnector<AppState, VoidCallback>(
              converter: (Store store) {
                return () => store.dispatch(IncrementAction(payload: {print("object")})); //发送数据
              },
              builder: (BuildContext context, VoidCallback callback) {
                return FloatingActionButton(
                    onPressed: callback, child: Icon(Icons.add));
              },
            ),
          ),
        ));
  }
}