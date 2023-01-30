// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/home/home_vu.dart';
import '/utils/we_router.dart';
import '../../models/user/model.dart';
import '../../services/we_store.dart';
import '/utils/widgets.dart';
import '../../services/we_auth.dart';

class LoginVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  UserData? user;
  List<UserData> users = [];
  bool checkValue = false;
  bool visibility = true;
  onCheckBoxChanged(value) {
    checkValue = value;
    notifyListeners();
  }

  Future login(BuildContext context) async {
    setBusy(true);
    bool isLoggedIn = await WeAuth.logIn(context, email.text.trim(), password.text.trim());
    isLoggedIn ? WeRouter.pushReplacement(context, const HomeScreen()) : null;

    setBusy(false);
  }

  Future forgotPassword(BuildContext context) async {
    setBusy(true);
    bool success = await WeAuth.forgotPassword(context, email.text.trim());
    if (success) {
      toaster(context, 'Reset code sent on ${email.text.trim()}. Check your mail box');
    }
    setBusy(false);
  }

  Future signInWithGoogle(BuildContext context) async {
    setBusy(true);
    bool isLoggedIn = await WeAuth.signInWithGoogle(context);
    if (isLoggedIn) {
      user = UserData(
        WeAuth.instance.auth.currentUser!.uid,
        WeAuth.instance.auth.currentUser!.displayName,
        WeAuth.instance.auth.currentUser!.email,
        false,
      );
      await storeUser();
      WeRouter.pushReplacement(context, const HomeScreen());
    }

    setBusy(false);
  }

  void onVisibilityChange() {
    visibility = !visibility;
    notifyListeners();
  }

  Future storeUser() async {
    await WeStore.add(user!.toMap(), newuser: true);
  }
}
