import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:wefit/models/workout_plan/model.dart';

class WorkoutVM extends BaseViewModel {
  int selectedCard = -1;
  int selectedTab = 1;
  int days = 30;
  List<WorkoutPlan> beginnerPlans = [
    WorkoutPlan('Mountain Climber', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Squats', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('High Stepping', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Push-Ups', 'assets/gifs/mountain_climber.gif', 'x10'),
    WorkoutPlan('Reverse Crunches', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('Plank', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Cobra Streatch', 'assets/gifs/mountain_climber.gif', '00:30'),
  ];
  List<WorkoutPlan> intermediatePlans = [
    WorkoutPlan('Mountain Climber', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Squats', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('High Stepping', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Push-Ups', 'assets/gifs/mountain_climber.gif', 'x10'),
    WorkoutPlan('Reverse Crunches', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('Plank', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Squats', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('High Stepping', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Push-Ups', 'assets/gifs/mountain_climber.gif', 'x10'),
    WorkoutPlan('Reverse Crunches', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('Plank', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Cobra Streatch', 'assets/gifs/mountain_climber.gif', '00:30'),
  ];
  List<WorkoutPlan> advancedPlans = [
    WorkoutPlan('Mountain Climber', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Squats', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('High Stepping', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Push-Ups', 'assets/gifs/mountain_climber.gif', 'x10'),
    WorkoutPlan('Reverse Crunches', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('Plank', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Squats', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('High Stepping', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Push-Ups', 'assets/gifs/mountain_climber.gif', 'x10'),
    WorkoutPlan('Reverse Crunches', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('Plank', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Squats', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('High Stepping', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Push-Ups', 'assets/gifs/mountain_climber.gif', 'x10'),
    WorkoutPlan('Reverse Crunches', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('Plank', 'assets/gifs/mountain_climber.gif', '00:30'),
    WorkoutPlan('Squats', 'assets/gifs/mountain_climber.gif', 'x16'),
    WorkoutPlan('Cobra Streatch', 'assets/gifs/mountain_climber.gif', '00:30'),
  ];

  void onCardSelect(int index) {
    selectedCard = index;
    notifyListeners();
  }

  ontabChanged(int tab) {
    selectedTab = tab;
    notifyListeners();
  }

  onInviteFriends() async {
    const String link = 'https://www.instagram.com/onlineusman/';
    await Share.share('Join WeFit $link');
  }
}
