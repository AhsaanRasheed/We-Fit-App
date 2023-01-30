import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../reminder/reminder_vm.dart';
import '/utils/constants.dart';
import '/utils/widgets.dart';

class ReminderScreen extends ViewModelBuilderWidget<ReminderVM> {
  const ReminderScreen({super.key});

  @override
  Widget builder(BuildContext context, ReminderVM viewModel, Widget? child) {
    return WeScaffold(
      scrollable: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('What time would you like to Exercise?', style: largeTextStyle),
          const SizedBox(height: 12),
          Text(
            'Any time you can choose but We recommend first thing in th morning.',
            style: descriptionStyle,
          ),
          const SizedBox(height: 36),
          timePicker(viewModel),
          const SizedBox(height: 24),
          Text('Which day would you like to Exercise?', style: largeTextStyle),
          const SizedBox(height: 36),
          daysListView(viewModel),
        ],
      ),
    );
  }

  @override
  ReminderVM viewModelBuilder(BuildContext context) {
    return ReminderVM();
  }
}

Widget wheelList(List list, {void Function(int)? onSelectedItemChanged}) {
  return Expanded(
    child: ListWheelScrollView(
      physics: const FixedExtentScrollPhysics(),
      itemExtent: 40,
      perspective: 0.005,
      overAndUnderCenterOpacity: 0.5,
      magnification: 1.5,
      onSelectedItemChanged: onSelectedItemChanged,
      children: [
        ...list.map((index) {
          return Text("$index", style: largeTextStyle);
        })
      ],
    ),
  );
}

Widget timePicker(ReminderVM viewModel) {
  return Container(
    height: 250,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        wheelList(viewModel.hours, onSelectedItemChanged: viewModel.onHourChanged),
        const VerticalDivider(),
        wheelList(viewModel.minutes, onSelectedItemChanged: viewModel.onMinuteChanged),
        const VerticalDivider(),
        wheelList(viewModel.timePeriods, onSelectedItemChanged: viewModel.onPeriodChanged)
      ],
    ),
  );
}

Widget daysListView(ReminderVM viewModel) {
  return SizedBox(
    height: 50,
    child: ListView.builder(
      itemExtent: 100,
      itemCount: viewModel.days.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: Text(viewModel.days[index], style: btnTextStyle),
        ),
      ),
    ),
  );
}
