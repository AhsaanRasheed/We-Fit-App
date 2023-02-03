import 'package:flutter/material.dart';
import 'package:wefit/home/workout/exercise_day_plans_list.dart';
import 'package:wefit/home/workout/workout_vm_days.dart';

import '../../models/workout_plan/model.dart';
import '../../utils/constants.dart';
import '../../utils/we_router.dart';

Widget workoutDays(List<WorkoutPlan> list, String type) {
  return Expanded(
    child: ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 8,
      itemBuilder: (context, index) {
        int key = index + 1;
        WorkoutWithDays plans = WorkoutWithDays(list, index+1);
        
        return GestureDetector(
          onTap: () => WeRouter.push(context, workoutDaysPlans(plans, key, type)),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Day $key", style: titleTextStyle),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
    ),
  );
}
// Expanded(
//     child: MasonryGridView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         physics: const BouncingScrollPhysics(),
//         gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: list.length,
//         crossAxisSpacing: 12,
//         mainAxisSpacing: 12,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () => debugPrint("$index"),
//             child: Container(
//               height: index.isEven
//                   ? index % 3 == 0 && index % 2 == 0
//                       ? 230
//                       : 150
//                   : 200,
//               decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
//               child: FittedBox(
//                 child: Icon(Icons.sports_gymnastics, color: primaryColor),
//               ),
//             ),
//           );
//         }),
//   );