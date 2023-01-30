import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/utils/constants.dart';
import 'package:wefit/utils/widgets.dart';
import '../../../models/workout_plan/model.dart';
import 'workout_detail_vm.dart';

class WorkoutDetailVU extends ViewModelBuilderWidget<WorkoutDetailVM> {
  final WorkoutPlan plan;
  const WorkoutDetailVU(this.plan, {super.key});

  @override
  Widget builder(BuildContext context, WorkoutDetailVM viewModel, Widget? child) {
    return WeScaffold(
      scrollable: false,
      appBar: weAppBar('Workout Details'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hero(
            tag: plan.name,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(plan.image, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(plan.name, style: largeTextStyle),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Duration'),
              Text(plan.time, style: titleTextStyle),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged')
        ],
      ),
    );
  }

  @override
  WorkoutDetailVM viewModelBuilder(BuildContext context) {
    return WorkoutDetailVM();
  }
}
