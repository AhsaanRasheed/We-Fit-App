import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_model.dart';

class GroupChatViewModel extends BaseViewModel {
  final controller = TextEditingController();
  List<Chat> messages = [];
  String msg = '';
  onChanged(String? value) {
    if (value != null) {
      msg = value.trim();
      notifyListeners();
    }
  }

  onSendMessage() {
    if (msg.isNotEmpty) {
      messages.add(Chat(UniqueKey(), msg, true, DateTime.now()));
      controller.clear();
      msg = '';
      notifyListeners();
    }
  }
}
