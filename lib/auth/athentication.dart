import 'package:cloud_firestore/cloud_firestore.dart';
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
  Navigator.pushReplacementNamed(context, '/dashboard');
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
          Map<String, dynamic> userdata =  {
              'useremail': user!.email,
              'displayname': user.displayName,
             
              'userid': user.uid,
              'userrole': "user",
            };
          FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .set(
                  userdata,
                  SetOptions(merge: true),
                );
Navigator.pushReplacementNamed(context, '/dashboard');
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

class CreateUserAccount extends StatefulWidget {
  final Map<String, dynamic> userdata;
  const CreateUserAccount(this.userdata, {super.key});
  @override
  CreateUserAccountState createState() => CreateUserAccountState();
}

class CreateUserAccountState extends State<CreateUserAccount> {
  final TextEditingController _textController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: TextField(
                controller: _textController,
              ),
            ),
            ElevatedButton(
              onPressed: () async{
//get the username from textfield
//and update data to firebase
        widget.userdata['username'] = _textController.text;
              await FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.userdata['userId'])
                    .set(
                      widget.userdata,
                      SetOptions(merge: true),
                    );
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TimeLinePage()));
              },
              child: Text("submit"),
            ),
          ],
        ));
  }
}