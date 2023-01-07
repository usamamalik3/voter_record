import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:voterrecord/screens/Register.dart';
import 'package:voterrecord/screens/dashboard.dart';

import '../global/widgets/textfield.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String role = "user";
  bool _isObscure = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 90.0),
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // if you need this
              side: BorderSide(
                color: Colors.black.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "لاگ ان",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "NotoNastaliqUrdu",
                        color: Theme.of(context).primaryColor, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                       CustomField(
                        maxline: 1,
                     
                      validattor: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        EmailValidator(errorText: "Email is not valid")
                      ]),
                      controler: emailController,
                      fldltxt: 'ای میل',
                      hint: 'examle@gmail.com',
                    ),
                    CustomField(
                      maxline: 1,
                      suffixicon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                      obscureText: _isObscure,
                      validattor: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        MinLengthValidator(8,
                            errorText: "پاس ورڈ 8 حرف کا ہونا چاہیے۔"),
                        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                            errorText:
                                "پاس ورڈ میں کم از کم ایک خاص حرف ہونا چاہیے۔"),
                      ]),
                      controler: passwordController,
                      fldltxt: 'پاس ورڈ',
                      hint: '*********',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            _login();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: const SizedBox(
                              height: 60,
                              width: 300,
                              child: Center(
                                child: Text(
                                  "لاگ ان کریں",
                                  style: TextStyle(
                                    fontFamily: 'NotoNastaliqUrdu',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text(
                      "اکاؤنٹ نہیں ہے؟",
                      style: TextStyle(fontFamily: 'NotoNastaliqUrdu', fontSize: 14),
                    )),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            "رجسٹر کریں",
                            style: TextStyle(
                                fontFamily: 'NotoNastaliqUrdu',
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }

 

  String? requiredValidator(value, messageError) {
    if (value.isEmpty) {
      return messageError;
    }
    return null;
  }


  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    setState(() {
      role = snap["role"];
    });
 
    if (role == "user") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
    }
    else if (role == "admin") {
    
      print("admin");
    }
  }

  _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        // ignore: deprecated_member_use
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        if (user != null) {
          _checkRole();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    showError(errormessage) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: const Text("Error"),
            content: new Text(errormessage),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new TextButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
