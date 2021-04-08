part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends UserEvent {
  //TODO: do it
}

class SignUpEvent extends UserEvent {
  //adfsasdf
}

class RecoverPasswordEvent extends UserEvent {
  //adfsasdf
}

class SignOutEvent extends UserEvent {
  //adfsasdf
}
