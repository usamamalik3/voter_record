import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voterrecord/screens/Dashboard.dart';
import 'package:voterrecord/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AL hayat 360',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white.withOpacity(.98),
          iconTheme: const IconThemeData(color: Color(0Xff008000), size: 40),
          primarySwatch: Colors.blue,
          cardTheme: const CardTheme(
            elevation: 4,
          ),
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color(0Xff008000),
                  ))),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0Xff008000))),
      home: DashBoard(),
    );
  }
}
