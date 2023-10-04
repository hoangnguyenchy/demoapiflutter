import 'package:bloc/bloc.dart';

import '../API/Api.dart';
import 'HomePageEvent.dart';
import 'HomePageState.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(InitialState()) {
    on<FetchDataEvent>(_fetchData);
  }

  Future<void> _fetchData(
    FetchDataEvent event,
    Emitter<HomePageState> emit,
  ) async {
    emit(InitialState());
    final jsonData = await Api.fetchData();
    if (jsonData != null) {
      print(jsonData);
      emit(DataLoadedState(jsonData));
    } else {
      emit(ErrorState());
    }
  }
}
