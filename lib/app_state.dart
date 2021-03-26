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

class IncrementAction {
  final payload;

  IncrementAction({this.payload});
}

AppState counterReducer(AppState state, dynamic action) {
  switch (action.runtimeType) {
    case IncrementAction:
      return state.copyWith(count: state.count + action.payload);
  }

  return state;
}
