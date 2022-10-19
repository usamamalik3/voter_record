import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:voterrecord/screens/partyfrom.dart';


class ExecutiveScreen extends StatefulWidget {
  const ExecutiveScreen({super.key});

  @override
  State<ExecutiveScreen> createState() => _ExecutiveScreenState();
}

class _ExecutiveScreenState extends State<ExecutiveScreen> {
  TextEditingController cnicController = TextEditingController();
  TextEditingController pswrdController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               const  Text('صرف عہدیدار ہی تلاش کر سکتے ہیں',
                style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 18),),
                CustomField(
                
                  inputFormatter: [maskFormatter],
                  keyboardType: TextInputType.number,
                  fldltxt: 'شناختی کارڈ',
                  hint: ' شناختی کارڈ یہاں لکھیں۔',
                  controler: cnicController,
                  validattor: RequiredValidator(errorText: "Required"),
                ),
                 CustomField(
                  
            suffixicon: IconButton(
                icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
                  
                  keyboardType: TextInputType.text,
                  fldltxt: 'پاسورڈ',
                  hint: 'یہاں لکھیں۔',
                  controler: pswrdController,
                  validattor: RequiredValidator(errorText: "Required"),
                ),
        
              ],
            ),
          ),
        ),
      ),
    );

  }
}