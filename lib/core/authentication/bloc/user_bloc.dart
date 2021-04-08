import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserUnauthenticatedState());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is SignInEvent) {
      //logs in
    } else if (event is SignOutEvent) {
      //sings out
    } else if (event is RecoverPasswordEvent) {
      //recover password
    } else if (event is SignUpEvent) {
      //sign up user
    }
  }
}
