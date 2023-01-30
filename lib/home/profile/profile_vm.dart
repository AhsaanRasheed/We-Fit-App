// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/utils/we_router.dart';

import '../../auth/login/login_vu.dart';
import '../../services/we_auth.dart';

class ProfileVM extends BaseViewModel {
  Future logout(BuildContext context) async {
    await WeAuth.logout();

    WeRouter.pushReplacement(context, const LoginScreen());
  }
}
