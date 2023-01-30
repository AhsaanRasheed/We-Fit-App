// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../models/user/model.dart';
import '../../services/we_auth.dart';
import '../../services/we_store.dart';
import '../../utils/we_router.dart';
import '../../utils/widgets.dart';
import '../login/login_vu.dart';

class SignupVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  UserData? user;
  List<UserData> users = [];
  bool visibility1 = true;
  bool visibility2 = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  onVisibility1Change() {
    visibility1 = !visibility1;
    notifyListeners();
  }

  onVisibility2Change() {
    visibility2 = !visibility2;
    notifyListeners();
  }

  bool validatePasswords(BuildContext context) {
    if ((email.text.isNotEmpty && password.text.isNotEmpty && confirmPassword.text.isNotEmpty) &&
        (password.text.trim() == confirmPassword.text.trim())) {
      return true;
    }
    toaster(context, "Password and Confirm Password should be match");
    return false;
  }

  Future signUp(BuildContext context) async {
    setBusy(true);
    bool isValidate = validatePasswords(context);
    if (isValidate) {
      bool success = await WeAuth.signUp(context, email.text.trim(), password.text.trim());
      if (success) {
        user = UserData(
          WeAuth.instance.auth.currentUser!.uid,
          WeAuth.instance.auth.currentUser!.displayName,
          WeAuth.instance.auth.currentUser!.email!,
          false,
        );
        await storeUser();

        WeRouter.push(context, const LoginScreen());
      }
    }
    setBusy(false);
  }

  storeUser() async {
    await WeStore.add(user!.toMap(), newuser: true);
  }
}
