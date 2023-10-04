
import 'package:bloc/bloc.dart';

import '../hhh.dart';
import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEvent) {
      try {
        yield LoginSuccess();
      } catch (_) {
        yield LoginFailure();
      }
    }
  }
}
