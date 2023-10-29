import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print("Error signing in: $error");
      return null;
    }
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential authResult =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print("Error signing up: $error");
      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        return user;
      }
      return null;
    } catch (error) {
      print("Error signing in with Google: $error");
      return null;
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Handle any errors that occur during the password reset process
      print('Error sending password reset email: $e');
      throw e; // You can handle the error as needed in your UI
    }
  }

}


