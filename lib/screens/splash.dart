import 'package:flutter/material.dart';
import 'package:voterrecord/global/widgets/full_screen_indicator.dart';
import 'package:voterrecord/screens/dashboard.dart';
import 'package:voterrecord/screens/signin.dart';

/// Splash screen shown while the app is loading.
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,
        '/sigin' );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => const FullScreenIndicator();
}
