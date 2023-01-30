import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'groups/groups_vu.dart';
import 'home_vm.dart';
import '../utils/constants.dart';
import '../utils/widgets.dart';
import 'profile/profile_vu.dart';
import 'reminder/reminder_vu.dart';
import 'workout/workout_vu.dart';

class HomeScreen extends ViewModelBuilderWidget<HomeVUModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeVUModel viewModel, Widget? child) {
    List widgetOptions = <Widget>[const GroupsScreen(), const WorkoutScreen(), const Center(child: Text('Call')), const ReminderScreen(), const ProfileScreen()];
    return WillPopScope(
      onWillPop: () async => false,
      child: WeScaffold(
        scrollable: false,
        padding: 0.0,
        topMargin: false,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.onTapBottomNavItem,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: Colors.white,
            elevation: 5,
            unselectedItemColor: Colors.black,
            selectedItemColor: primaryColor,
            items: [
              BottomNavigationBarItem(
                  icon: svgHolder(
                    'assets/bottom_icons/home.svg',
                    color: viewModel.currentIndex == 0 ? primaryColor : null,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: svgHolder(
                    'assets/bottom_icons/workout.svg',
                    color: viewModel.currentIndex == 1 ? primaryColor : null,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: svgHolder(
                    'assets/bottom_icons/centre.svg',
                    color: viewModel.currentIndex == 2 ? primaryColor : null,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: svgHolder(
                    'assets/bottom_icons/time.svg',
                    color: viewModel.currentIndex == 3 ? primaryColor : null,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: svgHolder(
                    'assets/bottom_icons/profile.svg',
                    color: viewModel.currentIndex == 4 ? primaryColor : null,
                  ),
                  label: '')
            ]),
        body: widgetOptions.elementAt(viewModel.currentIndex),
      ),
    );
  }

  @override
  HomeVUModel viewModelBuilder(BuildContext context) {
    return HomeVUModel();
  }
}
