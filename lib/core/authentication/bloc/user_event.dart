part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends UserEvent {
  final String email;
  final String password;

  SignInEvent({
    @required this.email,
    @required this.password,
  });

  List<Object> get props => [email, password];
}

class SignUpEvent extends UserEvent {
  final String email;
  final String password;

  SignUpEvent({
    @required this.email,
    @required this.password,
  });

  List<Object> get props => [email, password];
}

class RecoverPasswordEvent extends UserEvent {
  //adfsasdf
}

class SignOutEvent extends UserEvent {
  //adfsasdf
}
