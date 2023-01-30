import 'package:wefit/models/user/model.dart';

class Profile {
  UserData? user;
  Profile(this.user);

  Profile.fromMap(Map<String, dynamic> map) {
    user!.name = map['name'];
    user!.email = map['email'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['name'] = user!.name;
    map['email'] = user!.email;
    return map;
  }
}
