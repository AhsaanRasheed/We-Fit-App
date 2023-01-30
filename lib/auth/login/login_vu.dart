import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/auth/signup/signup_vu.dart';
import 'package:wefit/utils/constants.dart';
import 'package:wefit/utils/loading_spinner.dart';
import 'package:wefit/utils/we_router.dart';

import '../../utils/widgets.dart';
import 'login_vm.dart';

class LoginScreen extends ViewModelBuilderWidget<LoginVM> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, LoginVM viewModel, Widget? child) {
    return LoadingSpinner(
      loading: viewModel.isBusy,
      child: WeScaffold(
          body: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            weLogo(),
            const SizedBox(height: 48),
            Align(alignment: Alignment.centerLeft, child: Text('Login', style: titleTextStyle)),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                    child: WeSocialButton(
                  logo: Logo.google,
                  onTap: () => viewModel.signInWithGoogle(context),
                )),
                const SizedBox(width: 18),
                const Expanded(child: WeSocialButton(logo: Logo.apple)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('or', style: socialBtnTextStyle),
                ),
                const Divider(),
              ],
            ),
            const SizedBox(height: 16),
            WeTextField(lable: 'Email', controller: viewModel.email),
            const SizedBox(height: 16),
            WeTextField(
              lable: 'Password',
              controller: viewModel.password,
              locked: true,
              obscureText: viewModel.visibility,
              onVisibilityChange: viewModel.onVisibilityChange,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Checkbox(checkColor: primaryColor, activeColor: Colors.transparent, value: viewModel.checkValue, onChanged: viewModel.onCheckBoxChanged),
                const Text('Remember me'),
                const Spacer(),
                GestureDetector(onTap: () => viewModel.forgotPassword(context), child: Text('Forgotton Password?', style: TextStyle(color: primaryColor)))
              ],
            ),
            const SizedBox(height: 16),
            WeButton(lable: 'Sign In', onTap: () => viewModel.login(context)),
            const SizedBox(height: 72),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const Text("Don't have account? "), GestureDetector(onTap: () => WeRouter.push(context, const SignUpScreen()), child: Text('SIGN UP', style: TextStyle(color: primaryColor)))],
            ),
          ],
        ),
      )),
    );
  }

  @override
  LoginVM viewModelBuilder(BuildContext context) {
    return LoginVM();
  }
}
