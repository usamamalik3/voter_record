import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:voterrecord/screens/dashboard.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase({
  required BuildContext context,
}) async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();

  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
  Navigator.pushNamed(context, '/dashboard');
  }

  return firebaseApp;
}
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
            Authentication.customSnackBar(content: 'account-exists-with-different-credential', context: context);
          } else if (e.code == 'invalid-credential') {
            // ...
            Authentication.customSnackBar(content: 'invalid-credential', context: context);
          }
        } catch (e) {
          // ...
           Authentication.customSnackBar(content: 'something went wrong', context: context);
        }
      }
    }

    return user;
  }
  static SnackBar customSnackBar({required String content , required BuildContext context} ) {
  return SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      content,
      style: TextStyle(color: Theme.of(context).primaryColor, letterSpacing: 0.5),
    ),
  );
}
   static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.', context: context,
        ),
      );
    }
  }

  
}