import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../authentication_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthenticationService auth =
      AuthenticationService(FirebaseAuth.instance);
  UserBloc() : super(UserUnauthenticatedState());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is SignInEvent) {
      yield* _signIn(event.email, event.password);
    } else if (event is SignOutEvent) {
      yield* _signOut();
    } else if (event is SignUpEvent) {
      yield* _signUp(event.email, event.password);
    }
  }

  Stream<UserState> _signUp(String email, String password) async* {
    try {
      final isAuthenticated = await auth.signUp(
        email: email,
        password: password,
      );
      if (isAuthenticated == "Signed up") {
        yield UserAuthenticatedState(auth.getUserID());
      }
    } catch (e) {
      print(e);
      yield UserUnauthenticatedState();
    }
  }

  Stream<UserState> _signOut() async* {
    auth.signOut();
    yield UserUnauthenticatedState();
  }

  Stream<UserState> _signIn(String email, String password) async* {
    try {
      final isAuthenticated = await auth.signIn(
        email: email,
        password: password,
      );
      if (isAuthenticated == "Signed in") {
        yield UserAuthenticatedState(auth.getUserID());
      }
    } catch (e) {
      print(e);
      yield UserUnauthenticatedState();
    }
  }
}
