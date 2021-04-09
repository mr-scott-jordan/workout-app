part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserAuthenticatedState extends UserState {
  final String userID;

  UserAuthenticatedState(this.userID);

  String getUserID() {
    return this.userID;
  }
}

class UserUnauthenticatedState extends UserState {
  //adfadsf
}
