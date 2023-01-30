import 'package:flutter/material.dart';

class Chat {
  UniqueKey? _id;
  String? message;
  DateTime? dateTime;
  bool? isMe;
  DateTime? timeStamp;
  Chat(this._id, this.message, this.isMe, this.dateTime);
  UniqueKey get id => _id!;

  Chat.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    message = map['message'];
    isMe = map['is_me'];
    dateTime = map['message_time'];
    timeStamp = map['timeStamp'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['id'] = _id;
    map['message'] = message;
    map['is_me'] = isMe;
    map['message_time'] = dateTime;
    return map;
  }
}
