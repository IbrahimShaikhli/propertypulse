import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_events.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  AuthBloc() : super(AuthInitial()) {
    on<SignInWithEmailAndPasswordEvent>(_mapSignInWithEmailAndPasswordEventToState);
    on<SignUpWithEmailAndPasswordEvent>(_mapSignUpWithEmailAndPasswordEventToState);
    on<SignInWithGoogleEvent>(_mapSignInWithGoogleEventToState);
    on<SignOutEvent>(_mapSignOutEventToState);
    on<SendPasswordResetEmailEvent>(_mapSendPasswordResetEmailEventToState);
  }

  Future<void> _mapSignInWithEmailAndPasswordEventToState(
      SignInWithEmailAndPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      final User? user = authResult.user;
      emit(AuthAuthenticated(user: user));
    } catch (error) {
      emit(AuthError(errorMessage: "Error signing in: $error"));
    }
  }

  Future<void> _mapSignUpWithEmailAndPasswordEventToState(
      SignUpWithEmailAndPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      if (event.email.isEmpty || event.password.isEmpty) {
        throw Exception("Email or password is empty");
      }
      final UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      final User? user = authResult.user;
      emit(AuthAuthenticated(user: user));
      print('success');
    } catch (error) {
      print('Error signing up: $error');
      emit(AuthError(errorMessage: "Error signing up: $error"));
    }
  }


  Future<void> _mapSignInWithGoogleEventToState(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        emit(AuthAuthenticated(user: user));
      }
    } catch (error) {
      emit(AuthError(errorMessage: "Error signing in with Google: $error"));
    }
  }

  Future<void> _mapSignOutEventToState(
      SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await googleSignIn.signOut();
      await _auth.signOut();
      emit(AuthUnauthenticated());
    } catch (error) {
      emit(AuthError(errorMessage: "Error signing out: $error"));
    }
  }

  Future<void> _mapSendPasswordResetEmailEventToState(
      SendPasswordResetEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _auth.sendPasswordResetEmail(email: event.email);
      emit(AuthInitial());
    } catch (error) {
      emit(AuthError(errorMessage: "Error sending a password reset email: $error"));
    }
  }
}
