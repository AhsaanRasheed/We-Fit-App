import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? id;
  String? name;
  String? email;
  bool selected = false;

  UserData(this.id, this.name, this.email, this.selected);

  UserData.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    name = map['name'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['email'] = email;
    map['name'] = name ?? 'Unknown';
    map['last_login'] = FieldValue.serverTimestamp();
    return map;
  }
}
