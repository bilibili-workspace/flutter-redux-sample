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