abstract class HomePageState {}

class InitialState extends HomePageState {}

class DataLoadedState extends HomePageState {
  final List<dynamic> data;

  DataLoadedState(this.data);
}

class ErrorState extends HomePageState {}
