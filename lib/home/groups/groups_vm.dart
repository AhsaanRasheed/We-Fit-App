import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import '../../models/user/model.dart';

import '../../services/we_store.dart';
import '../../utils/we_router.dart';
import 'groups_model.dart';

class GroupsVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final sController = TextEditingController();
  final nController = TextEditingController();
  List<Group> filteredGroups = [];
  bool enabled = false;
  String groupName = '';
  List<Group> groups = [];
  final List<Map<String, dynamic>> groupMembers = [];
  void onGroupNameSaved(value) {
    groupName = value;
    notifyListeners();
  }

  void onCreateGroup(BuildContext context, [Key? key]) async {
    if (nController.text.trim().isNotEmpty && groupMembers.isNotEmpty) {
      formKey.currentState!.save();
      WeRouter.pop(context);
      setBusy(true);
      final Group group = Group('assets/groupIcon.jpg', groupName, groupMembers);
      await WeStore.add(group.toMap(), newuser: false, endPoint: 'groups', id: groupName);
      await getGroups();
      nController.clear();
      setBusy(false);
    }
  }

  Future<List<Group>> getGroups() async {
    setBusy(true);
    final dbGroups = await WeStore.get(endPoint: 'groups');
    groups = dbGroups.docs.map((group) => Group.fromMap(group.data())).toList();
    setBusy(false);
    return groups;
  }

  onGetGroupMembers(users) {
    groupMembers.clear();
    if (users != null) {
      for (var u in users) {
        UserData userData = UserData(u.id, u.name, u.email, u.selected);
        var map = userData.toMap();
        map.remove('last_login');
        groupMembers.add(map);
      }
      notifyListeners();
    }
  }

  void onSearchGroup(String query) {
    final suggestions = groups.where((group) {
      final name = group.groupName!.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();
    filteredGroups = suggestions;
    notifyListeners();
  }
}
