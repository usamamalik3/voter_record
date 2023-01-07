

import 'package:flutter/material.dart';
import 'package:voterrecord/auth/athentication.dart';
import 'package:voterrecord/utils/signinbutton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 20.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          
          children: [
            Row(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Image.asset("assets/images/crane.png",
                 width: 200,),
              
                ],
              ),
            ),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return const GoogleSignInButton();
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                   Theme.of(context).primaryColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}