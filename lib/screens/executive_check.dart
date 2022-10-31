import 'package:flutter/material.dart';

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
  // ignore: non_constant_identifier_names
  executive_check() async {
 
                          
  }
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
                 validattor: MultiValidator([
        RequiredValidator(errorText: "Required"),
        MinLengthValidator(8, errorText: "Password should b 8 character"),
        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
            errorText: "Password must have atleast one special character"),
      ]),
                ),
                 Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24).copyWith(top: 30),
              child: !isLoading
                  ? Center(
                      child: ElevatedButton(
                          onPressed: 
                               ()  {

                               Navigator.pushNamed(context, "/votersearch");
                               },
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 20),
                          )),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            )
        
              ],
            ),
          ),
        ),
      ),
    );

  }
}