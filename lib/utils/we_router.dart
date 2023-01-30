import 'package:flutter/material.dart';

class WeRouter {
  static Future push(BuildContext context, Widget destination) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => destination));
  }

  static Future pushReplacement(BuildContext context, Widget destination) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => destination));
  }

  static pop<T extends Object>(BuildContext context, [T? result]) {
    Navigator.pop(context, result);
  }
}
