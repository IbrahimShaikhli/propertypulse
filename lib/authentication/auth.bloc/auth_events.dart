import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignUpWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const SignUpWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class SendPasswordResetEmailEvent extends AuthEvent {
  final String email;

  const SendPasswordResetEmailEvent({required this.email});

  @override
  List<Object> get props => [email];
}
