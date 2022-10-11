import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voterrecord/global/widgets/textfield.dart';



class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}
 final firestoreInstance = FirebaseFirestore.instance;
 

 void _setData() async{
   
   firestoreInstance.collection("District").doc('ساہیوال').set(
       {
         "ضلع" : [ "ساہیوال ضلع" , "ضلع اوکاڑہ",  "ضلع پاکپتن"],
        
         }
       ).then((_){
     print("success!");
   });
 }

TextEditingController tempcontroller = TextEditingController();
bool isLoading = false;

class _TempState extends State<Temp> {
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: Column(
      
      children: [
        CustomField(controler: tempcontroller, fldltxt: 'divison', hint: 'write down',),
         Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24).copyWith(top: 30),
              child: !isLoading
                  ? Center(
                      child: ElevatedButton(
                          onPressed: (){
                           _setData();
                          } ,
                            
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 20),
                          )),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            
      ],
    ),
    );
  }
}