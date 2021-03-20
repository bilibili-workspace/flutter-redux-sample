// store/index.dart
import 'package:redux/redux.dart';

//步骤2，用于在步骤三中做消息区分与消息发送
class IncrementAction {
  final payload;

  IncrementAction({this.payload});
}

class AppState {
  int count;

  AppState({
    this.count,
  });

  static AppState initialState() {
    return AppState(
      count: 0,
    );
  }

  AppState copyWith({count}) {
    return AppState(
      count: count ?? this.count,
    );
  }
}

//步骤1的数据共享类是count,一个基本数据类型
//步骤3，处理数据的更新逻辑，此处是做加一操作，注意需要把新的类型返回
AppState counterReducer(AppState state, dynamic action) {
  switch (action.runtimeType) {
    case IncrementAction:
      return state.copyWith(count: state.count + action.payload);
  }

  return state;
}
