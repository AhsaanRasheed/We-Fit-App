import 'package:stacked/stacked.dart';

import '../../models/user/model.dart';
import '../../services/we_store.dart';

class ContactsVM extends BaseViewModel {
  List<UserData> selectedContacts = [];
  onMultiSelection(int index) {
    users[index].selected = !users[index].selected;
    users[index].selected ? selectedContacts.add(users[index]) : selectedContacts.remove(users[index]);
    notifyListeners();
  }

  onDeSelection() {
    selectedContacts.clear();
    for (var u in users) {
      u.selected = false;
    }
    notifyListeners();
  }

  List<UserData> users = [];
  Future<List<UserData>> getUsers() async {
    var dbUsers = await WeStore.get(fromRoot: true);
    users = dbUsers.docs.map((user) => UserData.fromMap(user.data())).toList();
    notifyListeners();
    return users;
  }
}
