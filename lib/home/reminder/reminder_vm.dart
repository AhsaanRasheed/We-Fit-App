import 'package:stacked/stacked.dart';

class ReminderVM extends BaseViewModel {
  String hour = '';
  String minute = '';
  String period = '';
  String reminder = '';
  List<int> hours = List.generate(12, (index) => index + 1);
  List<int> minutes = List.generate(59, (index) => index + 1);
  List<String> timePeriods = ['AM', 'PM'];
  List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  onHourChanged(int hour) {
    this.hour = hours[hour].toString().padLeft(2, '0');
    notifyListeners();
  }

  onMinuteChanged(int minute) {
    this.minute = minutes[minute].toString().padLeft(2, '0');
    notifyListeners();
  }

  onPeriodChanged(int period) {
    this.period = timePeriods[period];
    notifyListeners();
  }

  getReminder() {
    reminder = "$hour:$minute ($period)";
    notifyListeners();
  }
}
