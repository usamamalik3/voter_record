

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:voterrecord/global/widgets/readonlytextfield.dart';
import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:intl/intl.dart';

import 'package:url_launcher/url_launcher.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  double? doubleStime;
  double? doubleEtime;

  launchWhatsApp() async {
    if (_formKey.currentState!.validate()) {
      var whatsapp = "+923080636461";
      var whatsappAndroid = Uri.parse(
          "whatsapp://send?phone=$whatsapp&text= میٹنگ شیڈول\n\n  ایجنڈا:${agendacontroller.text}\n\n موضوع:${subjectcontroller.text}\n\n تاریخ:${dateinput.text}\n\n وقت آغآز: ${starttime.text} \n\n وقت اختتام:${endtime.text}");
      if (await canLaunchUrl(whatsappAndroid)) {
        await launchUrl(whatsappAndroid);
        
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("WhatsApp is not installed on the device"),
          ),
        );
      }
    }
    // final link = WhatsAppUnilink(
    //   phoneNumber: '+92308-0636461',
    //   text:    "text= ایجنڈا:${agendacontroller.text}\n\n موضوع:${subjectcontroller.text}\n\n تاریخ:${dateinput.text}\n\n وقت آغآز: ${starttime.text} \n\n وقت اختتام:${endtime.text}",
    // );

    //    try {
    //     final url = Uri.parse('$link');
    //      await launchUrl(url);
    //     } catch (e) {
    //       Fluttertoast.showToast(msg: 'Unable to open whatsapp');

    //       //To handle error and display error message

    //     }
  }

  // Future<void> _selectTime(BuildContext context) async {}

  TextEditingController agendacontroller = TextEditingController(  text: '\u200B');
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController daycontroller = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController starttime = TextEditingController();
  TextEditingController endtime = TextEditingController();
  TextEditingController duration = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'میٹنگ  شیڈول',
                    style:
                        TextStyle(fontFamily: 'NotoNastaliqUrdu', fontSize: 20),
                  )),
                ),
                CustomField(
                  hint: "یہاں لکھیں \u2022",
                  fldltxt: 'ایجنڈا',
                
                  controler: agendacontroller,
                  maxline: 5,
                  validattor: RequiredValidator(errorText: "Required"),
                ),
                CustomField(
                  hint: "یہاں لکھیں",
                  fldltxt: 'موضوع',
                  controler: subjectcontroller,
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
                          title: 'تاریخ ',
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
                                  String formattedDay =
                                  DateFormat('EEEE').format(pickedDate);
                              setState(() {
                                dateinput.text = formattedDate;
                                
                               daycontroller.text= formattedDay;
                               
                              });
                            }
                          },
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: width * 0.5,
                        child: ReadTextField(
                          title: 'وقت اختتام',
                          value: 'یہاں لکھیں۔',
                          controler: endtime,
                          ontap: () async {
                            final TimeOfDay? pickedE = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());
                            setState(() {
                              doubleStime = pickedE!.hour.toDouble() +
                                  (pickedE.minute.toDouble() / 60);
                            });

                            if (pickedE != null &&
                                pickedE != TimeOfDay.now() &&
                                doubleEtime! < doubleStime!) {
                              setState(() {
                                endtime.text = pickedE.format(context);
                              });
                            }
                          },
                        )),
                    SizedBox(
                        width: width * 0.5,
                        child: ReadTextField(
                          title: 'وقت آغاز',
                          value: 'یہاں لکھیں۔',
                          controler: starttime,
                          ontap: () async {
                            final TimeOfDay? pickedS = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());
                            setState(() {
                              doubleEtime = pickedS!.hour.toDouble() +
                                  (pickedS.minute.toDouble() / 60);
                            });

                            if (pickedS != null && pickedS != TimeOfDay.now()) {
                              setState(() {
                                starttime.text = pickedS.format(context);
                              });
                            }
                          },
                        )),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24)
                        .copyWith(top: 30),
                    child: Center(
                      child: ElevatedButton(
                          onPressed: (() async {
                            await launchWhatsApp();
                          }),
                          child: const Text(
                            "Whatsapp",
                            style: TextStyle(fontSize: 20),
                          )),
                    ))
              ],
            )),
      ),
    );
  }
}
