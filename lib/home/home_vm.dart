import 'package:stacked/stacked.dart';

class HomeVUModel extends BaseViewModel {
  // List<Widget> widgetOptions;

  int currentIndex = 0;
  onTapBottomNavItem(i) {
    currentIndex = i;
    notifyListeners();
  }
}
