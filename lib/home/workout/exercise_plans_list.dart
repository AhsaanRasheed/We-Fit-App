import 'package:flutter/material.dart';

import '../../models/workout_plan/model.dart';
import '../../utils/constants.dart';
import '../../utils/we_router.dart';
import 'workout_details/workout_detail_vu.dart';

Widget workoutPlans(List<WorkoutPlan> list) {
  return Expanded(
    child: ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final plan = list[index];
        return GestureDetector(
          onTap: () => WeRouter.push(context, WorkoutDetailVU(plan)),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Hero(
                    tag: plan.name,
                    child: Image.asset(plan.image),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plan.name.toUpperCase(), style: titleTextStyle),
                    const SizedBox(height: 8),
                    Text(
                      plan.time,
                      style: TextStyle(color: primaryColor.withOpacity(0.5)),
                    )
                  ],
                ),
              ],
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