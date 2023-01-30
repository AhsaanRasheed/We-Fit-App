import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/services/we_auth.dart';
import '/utils/constants.dart';
import '/utils/widgets.dart';

import 'profile_vm.dart';

class ProfileScreen extends ViewModelBuilderWidget<ProfileVM> {
  const ProfileScreen({super.key});

  @override
  Widget builder(BuildContext context, ProfileVM viewModel, Widget? child) {
    final Size size = MediaQuery.of(context).size;
    return WeScaffold(
      scrollable: false,
      topMargin: false,
      padding: 0,
      body: Column(
        children: [accountBox(size, viewModel), actionTiles(context, viewModel)],
      ),
    );
  }

  @override
  ProfileVM viewModelBuilder(BuildContext context) {
    return ProfileVM();
  }
}

//CUSTOM WIDGETS
Widget accountBox(Size size, ProfileVM viewModel) {
  return Container(
    padding: const EdgeInsets.only(left: 24, right: 36),
    height: size.height * 0.25,
    color: primaryColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.notifications_outlined,
            size: 30,
            color: whiteColor,
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: whiteColor,
              backgroundImage: const AssetImage('assets/user.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  WeAuth.instance.auth.currentUser!.displayName ?? 'Unknown', // will be change later
                  style: btnTextStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  WeAuth.instance.auth.currentUser!.email!, // will be change later
                  style: mediumTextStyle,
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget profileCard(String title, IconData icon, {bool isProfileCard = false, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(icon, color: isProfileCard ? primaryColor : null, size: 18),
            const SizedBox(width: 8),
            Text(
              title,
              style: isProfileCard ? btnTextStyle.copyWith(color: primaryColor) : mediumTextStyle.copyWith(color: blackColor),
            )
          ],
        ),
      ),
    ),
  );
}

Widget actionTiles(BuildContext context, ProfileVM viewModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: Column(
      children: [
        profileCard('My profile', Icons.person, isProfileCard: true),
        profileCard('Email', Icons.email),
        profileCard('Password', Icons.lock),
        profileCard('Help Center', Icons.help_center),
        profileCard('Settings', Icons.settings),
        profileCard('Logout', Icons.logout, isProfileCard: true, onTap: () => viewModel.logout(context)),
      ],
    ),
  );
}
