

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:voterrecord/screens/PartyForm/partyfrom.dart';
import 'package:voterrecord/utils/dropdown_list.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}
String? provincevalue;
String? zonevalue;
List<dynamic> zone = [];

class _RegisterState extends State<Register> {
  final firestoreInstance = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController cnfrmpasswordController = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController address = TextEditingController();
  bool _isObscure = true;
  getzone(province) async {
    await FirebaseFirestore.instance
        .collection("Zone")
        .doc(province)
        .get()
        .then((value) {
      setState(() {
        zone = value.data()!["زون"];
      });
    });
  }
   @override
  initState() {
    super.initState();
   
   
    
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60.0),
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
                      "رجسٹر",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 36),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomField(
                      keyboardType: TextInputType.emailAddress,
                      maxline: 1,
                      
                      validattor: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        EmailValidator(errorText: "ای میل درست نہیں ہے۔")
                      ]),
                      controler: emailController,
                      fldltxt: 'ای میل',
                      hint: 'examle@gmail.com',
                    ),
                    Row(
                      children: [
                        SizedBox(
                  width: width * 0.4,
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "زون",
                            style: TextStyle(fontFamily: "NotoNastaliqUrdu"),
                          )),
                    ),
                    subtitle: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.withOpacity(
                            .3), //background color of dropdown button

                        borderRadius: BorderRadius.circular(
                            12), //border raiuds of dropdown button
                      ),
                      child: DropdownButton(
                        underline: const SizedBox.shrink(),
                        iconEnabledColor: Theme.of(context).primaryColor,
                        isExpanded: true,
                        alignment: AlignmentDirectional.bottomEnd,
                        
                        value: zonevalue,
                        items: zone.map((zon) {
                          return DropdownMenuItem(
                            value: zon,
                            child: Center(child: Text(zon.toString())),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            zonevalue = (newValue ?? "").toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  width: width * 0.4,
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "صوبہ",
                            style: TextStyle(fontFamily: "NotoNastaliqUrdu"),
                          )),
                    ),
                    subtitle: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.withOpacity(
                            .3), //background color of dropdown button

                        borderRadius: BorderRadius.circular(
                            12), //border raiuds of dropdown button
                      ),
                      child: DropdownButton(
                        underline: const SizedBox.shrink(),
                        iconEnabledColor: Theme.of(context).primaryColor,
                        isExpanded: true,
                        alignment: AlignmentDirectional.bottomEnd,
                        value: provincevalue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Center(child: Text(items)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                             provincevalue == newValue.toString();
                             getzone(provincevalue);
                             zonevalue == null;
                            
                          });
                        
                        },
                      ),
                    ),
                  ),
                ),
                      ],
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
                      validattor: (val) {
                        if (val!.isEmpty) {
                          return "Required";
                        }
                        return MatchValidator(
                                errorText: "پاس ورڈز مماثل نہیں ہیں۔")
                            .validateMatch(val, passwordController.text);
                      },
                      controler: cnfrmpasswordController,
                      fldltxt: 'کنفرم پاس ورڈ',
                      hint: '********',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            _signup();
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
                                  "رجسٹر کریں",
                                  style: TextStyle(
                                    fontFamily: 'NotoNastaliqUrdu',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 24,
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
                      "پہلے سے اکاؤنٹ ہے؟",
                      style: TextStyle(fontFamily: 'NotoNastaliqUrdu', fontSize: 14),
                    )),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: Text(
                            "لاگ ان کریں",
                            style: TextStyle(
                                fontFamily: 'NotoNastaliqUrdu',
                                fontSize: 12,
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

//  Form(child: Column(

  String? requiredValidator(value, messageError) {
    if (value.isEmpty) {
      return messageError;
    }
    return null;
  }

  _signup() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        var firebaseUser = FirebaseAuth.instance.currentUser;
        await firebaseUser!.reload();

        firestoreInstance.collection("users").doc(firebaseUser.uid).set({
          "email": emailController.text,
          "password": passwordController.text,
          "role": "user",
        }).then((value) {
          print("success!");
        });
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "email-already-in-use":
            Fluttertoast.showToast(
                msg: e.message!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Theme.of(context).primaryColor,
                fontSize: 18.0);

            break;
            return e.message;
        }
      }
    }
  }
}
