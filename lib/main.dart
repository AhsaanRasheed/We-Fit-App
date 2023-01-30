import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/home/splash/splash.dart';
import '/utils/constants.dart';
import '/utils/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeFit',
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor, secondary: primaryColor),
      ),
      home: const SplashScreen(),
    );
  }
}