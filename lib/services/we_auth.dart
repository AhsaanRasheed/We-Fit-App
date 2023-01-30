import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wefit/utils/preferences.dart';
import '../utils/widgets.dart';

class WeAuth {
  static WeAuth? _weAuth;
  static WeAuth get instance => _weAuth ??= WeAuth();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn gInstance = GoogleSignIn();
  final String _token = 'FIREBASE_USER';
  static Future<bool> signUp(BuildContext context, String email, String password) async {
    try {
      await instance.auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      toaster(context, e.message.toString());
      return false;
    }
  }

  static Future<bool> logIn(BuildContext context, String email, String password) async {
    try {
      await instance.auth.signInWithEmailAndPassword(email: email, password: password);
      UserPreferences.setToken(instance._token);
      return true;
    } on FirebaseAuthException catch (e) {
      toaster(context, e.message.toString());
      return false;
    }
  }

  static Future<bool> forgotPassword(BuildContext context, String email) async {
    try {
      await instance.auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      toaster(context, e.message.toString());
      return false;
    }
  }

  static Future<bool> signInWithGoogle(BuildContext context) async {
    try {
      await instance.gInstance.signOut();
      final GoogleSignInAccount? googleUser = await instance.gInstance.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await instance.auth.signInWithCredential(credential);
      UserPreferences.setToken(instance._token);
      return true;
    } on FirebaseAuthException catch (e) {
      toaster(context, e.message.toString());
      return false;
    } on PlatformException catch (err) {
      toaster(context, err.code.toString().toUpperCase());
      return false;
    } catch (error) {
      return false;
    }
  }

  static Future logout() async {
    try {
      await instance.auth.signOut();
      await instance.gInstance.signOut();
      await UserPreferences.setToken('');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    } catch (u) {
      debugPrint(u.toString());
    }
  }
}
