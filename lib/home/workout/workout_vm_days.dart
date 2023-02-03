import 'package:stacked/stacked.dart';
import 'package:wefit/models/workout_plan/model.dart';

class WorkoutWithDays extends BaseViewModel {
  final List<WorkoutPlan> exercises;
  final int dayNo;
  WorkoutWithDays(this.exercises, this.dayNo);

  List<WorkoutPlan> getBeginner() {
    List<WorkoutPlan> workouts = [];
    if (dayNo == 1) {
      workouts.add(exercises[0]);
      workouts.add(exercises[1]);
      workouts.add(exercises[2]);
      workouts.add(exercises[3]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 2) {
      workouts.add(exercises[0]);
      workouts.add(exercises[7]);
      workouts.add(exercises[8]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 3) {
      workouts.add(exercises[0]);
      workouts.add(exercises[8]);
      workouts.add(exercises[11]);
      workouts.add(exercises[12]);
      workouts.add(exercises[13]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 5) {
      workouts.add(exercises[14]);
      workouts.add(exercises[15]);
      workouts.add(exercises[3]);
      workouts.add(exercises[12]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } 
    else if (dayNo == 6) {
      workouts.add(exercises[14]);
      workouts.add(exercises[7]);
      workouts.add(exercises[2]);
      workouts.add(exercises[16]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    }
     else if (dayNo == 7) {
      workouts.add(exercises[14]);
      workouts.add(exercises[7]);
      workouts.add(exercises[15]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    }

    return workouts;
  }

  List<WorkoutPlan> getIntermediate() {
    List<WorkoutPlan> workouts = [];
    if (dayNo == 1) {
      workouts.add(exercises[0]);
      workouts.add(exercises[1]);
      workouts.add(exercises[2]);
      workouts.add(exercises[3]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[1]);
      workouts.add(exercises[2]);
      workouts.add(exercises[3]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 2) {
      workouts.add(exercises[0]);
      workouts.add(exercises[7]);
      workouts.add(exercises[8]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
      workouts.add(exercises[7]);
      workouts.add(exercises[8]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
    } else if (dayNo == 3) {
      workouts.add(exercises[0]);
      workouts.add(exercises[8]);
      workouts.add(exercises[11]);
      workouts.add(exercises[12]);
      workouts.add(exercises[13]);
      workouts.add(exercises[5]);
      workouts.add(exercises[8]);
      workouts.add(exercises[11]);
      workouts.add(exercises[12]);
      workouts.add(exercises[13]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 5) {
      workouts.add(exercises[14]);
      workouts.add(exercises[15]);
      workouts.add(exercises[3]);
      workouts.add(exercises[12]);
      workouts.add(exercises[4]);
      workouts.add(exercises[12]);
      workouts.add(exercises[5]);
      workouts.add(exercises[15]);
      workouts.add(exercises[3]);
      workouts.add(exercises[12]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 6) {
      workouts.add(exercises[14]);
      workouts.add(exercises[7]);
      workouts.add(exercises[2]);
      workouts.add(exercises[16]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[7]);
      workouts.add(exercises[2]);
      workouts.add(exercises[16]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 7) {
      workouts.add(exercises[14]);
      workouts.add(exercises[7]);
      workouts.add(exercises[15]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[7]);
      workouts.add(exercises[15]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    }
    return workouts;
  }

  List<WorkoutPlan> getAdvanced() {
    List<WorkoutPlan> workouts = [];
    if (dayNo == 1) {
      workouts.add(exercises[0]);
      workouts.add(exercises[1]);
      workouts.add(exercises[2]);
      workouts.add(exercises[3]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[1]);
      workouts.add(exercises[2]);
      workouts.add(exercises[3]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[1]);
      workouts.add(exercises[2]);
      workouts.add(exercises[3]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 2) {
      workouts.add(exercises[0]);
      workouts.add(exercises[7]);
      workouts.add(exercises[8]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
      workouts.add(exercises[7]);
      workouts.add(exercises[8]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[6]);
      workouts.add(exercises[7]);
      workouts.add(exercises[8]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
    } else if (dayNo == 3) {
      workouts.add(exercises[0]);
      workouts.add(exercises[8]);
      workouts.add(exercises[11]);
      workouts.add(exercises[12]);
      workouts.add(exercises[13]);
      workouts.add(exercises[5]);
      workouts.add(exercises[8]);
      workouts.add(exercises[11]);
      workouts.add(exercises[12]);
      workouts.add(exercises[13]);
      workouts.add(exercises[5]);
      workouts.add(exercises[8]);
      workouts.add(exercises[11]);
      workouts.add(exercises[12]);
      workouts.add(exercises[13]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 5) {
      workouts.add(exercises[14]);
      workouts.add(exercises[15]);
      workouts.add(exercises[3]);
      workouts.add(exercises[12]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[15]);
      workouts.add(exercises[3]);
      workouts.add(exercises[12]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[15]);
      workouts.add(exercises[3]);
      workouts.add(exercises[12]);
      workouts.add(exercises[4]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 6) {
      workouts.add(exercises[14]);
      workouts.add(exercises[7]);
      workouts.add(exercises[2]);
      workouts.add(exercises[16]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[7]);
      workouts.add(exercises[2]);
      workouts.add(exercises[16]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[7]);
      workouts.add(exercises[2]);
      workouts.add(exercises[16]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    } else if (dayNo == 7) {
      workouts.add(exercises[14]);
      workouts.add(exercises[7]);
      workouts.add(exercises[15]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[7]);
      workouts.add(exercises[15]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[7]);
      workouts.add(exercises[15]);
      workouts.add(exercises[9]);
      workouts.add(exercises[10]);
      workouts.add(exercises[5]);
      workouts.add(exercises[6]);
    }
    return workouts;
  }
}
