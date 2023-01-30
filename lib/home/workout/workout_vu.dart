import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/home/workout/exercise_plans_list.dart';
import 'package:wefit/home/workout/exercise_plans_lists.dart';

import '../../utils/constants.dart';
import '../../utils/widgets.dart';
import 'workout_vm.dart';

class WorkoutScreen extends ViewModelBuilderWidget<WorkoutVM> {
  const WorkoutScreen({super.key});

  @override
  Widget builder(BuildContext context, WorkoutVM viewModel, Widget? child) {
    final double size = MediaQuery.of(context).size.height;
    return WeScaffold(
      padding: 0,
      scrollable: false,
      body: Column(
        children: [
          myExerciseHeading(),
          const SizedBox(height: 18),
          myExerciseList(size, viewModel),
          const SizedBox(height: 36),
          exerciseTabs(viewModel),
          const SizedBox(height: 24),
          exerciseHeading(context, viewModel),
          exerciseTabView(viewModel, size),
        ],
      ),
    );
  }

  @override
  WorkoutVM viewModelBuilder(BuildContext context) {
    return WorkoutVM();
  }
}

// CUSTOM WIDGETS

Padding myExerciseHeading() {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Row(
      children: const [
        Text('My Workout Plan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        Spacer(),
        Expanded(flex: 2, child: WeButton(lable: 'Freinds Plans', height: 30)),
      ],
    ),
  );
}

Padding exerciseHeading(BuildContext context, WorkoutVM viewModel) {
  return Padding(
    padding: const EdgeInsets.all(24),
    child: Row(
      children: [
        const Text('Days', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const Spacer(),
        Expanded(
            child: WeButton(
          lable: 'Add Friends',
          height: 30,
          onTap: () => viewModel.onInviteFriends(),
        )),
      ],
    ),
  );
}

Widget exerciseTabView(WorkoutVM viewModel, double size) {
  return Builder(
    builder: (context) {
      if (viewModel.selectedTab == 1) {
        return workoutPlanss(viewModel.beginnerPlans);
      }
      if (viewModel.selectedTab == 2) {
        return workoutPlanss(viewModel.intermediatePlans);
      } else {
        return workoutPlanss(viewModel.advancedPlans);
      }
    },
  );
}

Widget myExerciseList(double size, WorkoutVM viewModel) {
  return SizedBox(
    height: size * 0.15,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () => viewModel.onCardSelect(index),
            child: Container(
              width: size * 0.15,
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(8),
                border: viewModel.selectedCard == index ? Border.all(color: primaryColor, width: 2) : null,
              ),
              child: FittedBox(
                  child: Icon(
                Icons.sports_gymnastics,
                color: primaryColor,
              )),
            ),
          )),
    ),
  );
}

Widget exerciseTabs(WorkoutVM viewModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(
      children: [
        Expanded(
            child: WeButton(
          lable: 'Beginner',
          height: 32,
          border: viewModel.selectedTab != 1,
          onTap: () => viewModel.ontabChanged(1),
        )),
        const SizedBox(width: 8),
        Expanded(
            child: WeButton(
          lable: 'Medium',
          height: 32,
          border: viewModel.selectedTab != 2,
          onTap: () => viewModel.ontabChanged(2),
        )),
        const SizedBox(width: 8),
        Expanded(
            child: WeButton(
          lable: 'Advanced',
          height: 32,
          border: viewModel.selectedTab != 3,
          onTap: () => viewModel.ontabChanged(3),
        )),
      ],
    ),
  );
}
