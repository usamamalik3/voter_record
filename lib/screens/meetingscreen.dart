import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:voterrecord/global/widgets/readonlytextfield.dart';
import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:intl/intl.dart';

class MeetinScreen extends StatefulWidget {
  const MeetinScreen({super.key});

  @override
  State<MeetinScreen> createState() => _MeetinScreenState();
}

class _MeetinScreenState extends State<MeetinScreen> {
  
  
  TextEditingController agendacontroller = TextEditingController();
   TextEditingController subjectcontroller = TextEditingController();
    TextEditingController daycontroller = TextEditingController();
     TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              'میٹنگ  شیڈول',
              style: TextStyle(fontFamily: 'NotoNastaliqUrdu', fontSize: 20),
            )),
          ),
          CustomField(
            hint: "یہاں لکھیں",
            fldltxt: 'ایجنڈا',
            controler: agendacontroller,
            maxline: 5,
            validattor: RequiredValidator(errorText: "Required"),
          ),
           CustomField(
            hint: "یہاں لکھیں",
            fldltxt: 'موضوع',
            controler: agendacontroller,
            validattor: RequiredValidator(errorText: "Required"),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.text,
                      fldltxt: 'بروز',
                      hint: 'یہاں لکھیں۔',
                      controler: daycontroller,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: ReadTextField(
                      
                      title: 'تاریخ پیدائش',
                      value: 'یہاں لکھیں۔',
                      controler: dateinput,
                      ontap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));
                        if (pickedDate == null) {
                          return;
                        } //ternary expression to check if date is null
                        else {
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          setState(() {
                            dateinput.text = formattedDate;
                          });
                        }
                      },
                    )),
              ],
            ),

          
        ],
      )),
    );
  }
}
