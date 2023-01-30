import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/auth/login/login_vu.dart';
import 'package:wefit/auth/signup/signup_vm.dart';
import 'package:wefit/utils/loading_spinner.dart';
import 'package:wefit/utils/widgets.dart';

import '../../utils/constants.dart';
import '../../utils/we_router.dart';

class SignUpScreen extends ViewModelBuilderWidget<SignupVM> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, SignupVM viewModel, Widget? child) {
    return LoadingSpinner(
      loading: viewModel.isBusy,
      child: WeScaffold(
          body: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            weLogo(),
            const SizedBox(height: 48),
            Align(alignment: Alignment.centerLeft, child: Text('Sign Up', style: titleTextStyle)),
            const SizedBox(height: 28),
            WeTextField(lable: 'Email', controller: viewModel.email),
            const SizedBox(height: 16),
            WeTextField(
              lable: 'Password',
              controller: viewModel.password,
              locked: true,
              obscureText: viewModel.visibility1,
              onVisibilityChange: () => viewModel.onVisibility1Change(),
            ),
            const SizedBox(height: 16),
            WeTextField(
              lable: 'Confirm Password',
              controller: viewModel.confirmPassword,
              locked: true,
              obscureText: viewModel.visibility2,
              onVisibilityChange: () => viewModel.onVisibility2Change(),
            ),
            const SizedBox(height: 24),
            WeButton(lable: 'Sign Up', onTap: () => viewModel.signUp(context)),
            const SizedBox(height: 72),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have account? "),
                GestureDetector(onTap: () => WeRouter.push(context, const LoginScreen()), child: Text('SIGN IN', style: TextStyle(color: primaryColor)))
              ],
            ),
          ],
        ),
      )),
    );
  }

  @override
  SignupVM viewModelBuilder(BuildContext context) {
    return SignupVM();
  }
}
