import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voterrecord/configs/routes.dart';
import 'package:voterrecord/screens/Register.dart';
import 'package:voterrecord/screens/TanzeemSazi/15rukniBody/bodyscreen.dart';
import 'package:voterrecord/screens/documents/halqabandia.dart';
import 'package:voterrecord/screens/partyForm/partyfrom.dart';
import 'package:voterrecord/screens/partyForm/search.dart';
import 'package:voterrecord/screens/tanzeemSazi/15rukniBody/zonebody.dart';
import 'package:voterrecord/screens/about/about_tlp.dart';
import 'package:voterrecord/screens/voter/voterscreen.dart';

import 'package:voterrecord/screens/dashboard.dart';
import 'package:voterrecord/screens/tanzeemSazi/meetingscreen.dart';
import 'package:voterrecord/screens/signin.dart';
import 'package:voterrecord/screens/splash.dart';

import 'screens/documents/documnets.dart';





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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       onGenerateRoute: Routes().generateRoute,
      title: 'AL hayat 360',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        // fontFamily:"NotoNastaliqUrdu",
        
          primaryColor: Colors.green,
          
          // fontFamily:  "NotoNastaliqUrdu",
          scaffoldBackgroundColor: Colors.white.withOpacity(.98),
          iconTheme: const IconThemeData(
            color: Color(0Xff008000),
          ),
          primarySwatch: Colors.green,
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
      home:    SplashScreen(),
    );
  }
}
