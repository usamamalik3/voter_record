import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:voterrecord/screens/Dashboard.dart';
import 'package:voterrecord/screens/add_data.dart';
import 'package:voterrecord/screens/partyfrom.dart';
import 'package:voterrecord/screens/votersearch.dart';
import 'package:voterrecord/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This wid1get is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AL hayat 360',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          primaryColor: Colors.green,
          scaffoldBackgroundColor: Colors.white.withOpacity(.98),
          iconTheme: const IconThemeData(
            color: Color(0Xff008000),
          ),
          primarySwatch: Colors.blue,
          cardTheme: CardTheme(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.green,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  minimumSize: const Size(300, 45))),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.greenAccent.withOpacity(.3),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none)),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0Xff008000))),
       initialRoute: '/',
      //when initial Route is given no need to add home widget for initial start point of app
      //full app route structure
     getPages: Routes.routes,
    );
  }
}
