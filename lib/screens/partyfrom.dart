import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:voterrecord/global/widgets/readonlytextfield.dart';

import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:voterrecord/models/database_service.dart';
import 'package:voterrecord/models/voter.dart';
import 'package:intl/intl.dart';

import '../utils/dropdown_list.dart';

class PartyForm extends StatefulWidget {
  const PartyForm({Key? key}) : super(key: key);

  @override
  State<PartyForm> createState() => _PartyFormState();
}

class _PartyFormState extends State<PartyForm> {
  TextEditingController farmnoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController snoController = TextEditingController();
  TextEditingController hnoController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController pollingstController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController nacontroller = TextEditingController();
  TextEditingController pacontroller = TextEditingController();
  final String naPrefix = "NA-";
  final String paPrefix = "PP-";
  String? proffession;

  var maskFormatter = MaskTextInputFormatter(
    mask: '#####-#######-#',
    filter: {"#": RegExp(r'[0-9]')},
  );
  var phonemaskFormatter = MaskTextInputFormatter(
      mask: '####-#######', filter: {"#": RegExp(r'[0-9]')});
  bool isLoading = false;
  bool agree = false;
  final _formKey = GlobalKey<FormState>();
  String? dropdownvalue;
  String? blddropdownvalue;
  String? genderr;
  String? divsionvalue;
  List<dynamic> divisons = [];
  getdata(distric) async {
    await FirebaseFirestore.instance
        .collection("Divsion")
        .doc(distric)
        .get()
        .then((value) {
      setState(() {
        divisons = value.data()!["ڈویژن"];
      });
    });
  }

  @override
  initState() {
    super.initState();
    getdata("پنجاب");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0Xff008000),
        title: const Center(child: Text("رکنیت فارم")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const ListTile(
              title: Center(
                  child: Text(
                "تحریک لبیک پاکستان",
                style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 18),
              )),
            ),
            SizedBox(
                width: width * 0.5,
                child: CustomField(
                  fldltxt: 'فارم نمبر',
                  hint: 'یہاں لکھیں۔',
                  controler: farmnoController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: 'ولدیت/زوجیت',
                      hint: 'یہاں لکھیں۔',
                      controler: fnameController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: 'مکمل نام',
                      hint: 'یہاں لکھیں۔',
                      controler: nameController,
                      validattor: RequiredValidator(errorText: "Required"),
                    ))
              ],
            ),
            Row(
              children: [
                 SizedBox(
                  width: width * 0.4,
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "جنس",
                          style: TextStyle(fontFamily: "NotoNastaliqUrdu"),
                        ),
                      ),
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
                        value: genderr,
                        items: gender.map((String gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Center(child: Text(gender)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            genderr = newValue ?? "";
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: width * 0.6,
                    child: CustomField(
                      inputFormatter: [maskFormatter],
                      keyboardType: TextInputType.number,
                      fldltxt: 'شناختی کارڈ',
                      hint: ' شناختی کارڈ یہاں لکھیں۔',
                      controler: cnicController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: 'عمر',
                      hint: 'یہاں لکھیں۔',
                      controler: snoController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: ReadTextField(
                      title: 'تاریخ پیدائش',
                      value: 'یہاں لکھیں۔',
                      controler: dateInput,
                      ontap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));
                        if (pickedDate == null) {
                          return;
                        } //ternary expression to check if date is null
                        else {
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          setState(() {
                            dateInput.text = formattedDate;
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
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: 'تعلیم',
                      hint: 'یہاں لکھیں۔',
                      controler: ageController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                  width: width * 0.5,
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "بلڈ گروپ",
                          style: TextStyle(fontFamily: "NotoNastaliqUrdu"),
                        ),
                      ),
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
                        value: blddropdownvalue,
                        items: bloodgrps.map((String bloodgrps) {
                          return DropdownMenuItem(
                            value: bloodgrps,
                            child: Center(child: Text(bloodgrps)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            blddropdownvalue = newValue ?? "";
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                width: width * 1.0,
                child: CustomField(
                  fldltxt: 'سکول/جامعہ',
                  hint: 'یہاں لکھیں۔',
                  controler: addressController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
            Padding(
                padding: EdgeInsets.only(left: 40, right: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(right: 8,),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "روزگار",
                                style:
                                    TextStyle(fontFamily: "NotoNastaliqUrdu"),
                              )),
                        ),
                      ),
                      Row(
                       
                        children: [
                          Expanded(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                              ),
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0.0),
                                title: const Text('سرکاری'),
                                value: profession[0],
                                groupValue: proffession,
                                onChanged: (value) {
                                  setState(() {
                                    proffession = value.toString();
                                    print(proffession);
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                              ),
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0.0),
                                title: const Text('پرائیوٹ'),
                                value: profession[1],
                                groupValue: proffession,
                                onChanged: (value) {
                                  setState(() {
                                    proffession = value.toString();
                             
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                              ),
                              child: RadioListTile(
                                contentPadding: const EdgeInsets.all(0.0),
                                title: const Text('کاروبار'),
                                value: profession[2],
                                groupValue: proffession,
                                onChanged: (value) {
                                  setState(() {
                                    proffession = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                              ),
                              child: RadioListTile(
                                dense: true,
                                contentPadding: const EdgeInsets.all(0.0),
                                title: const Text('ملازمت'),
                                value: profession[3],
                                groupValue: proffession,
                                onChanged: (value) {
                                  setState(() {
                                    proffession = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])),
            Row(
              children: [
                 SizedBox(
                width: width * 0.5,
                child: CustomField(
                  keyboardType: TextInputType.number,
                  fldltxt: 'واٹس ایپ نمبر',
                  hint: 'یہاں لکھیں۔',
                  controler: pollingstController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      inputFormatter: [phonemaskFormatter],
                      keyboardType: TextInputType.phone,
                      fldltxt: 'موبائل نمبر',
                      hint: 'یہاں لکھیں۔',
                      controler: pollingstController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
              ],
            ),
           
            Row(
              children: [
                SizedBox(
                  width: width * 0.5,
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "ڈویژن",
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
                        value: divsionvalue,
                        items: divisons.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Center(child: Text(e.toString())),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            divsionvalue = newValue.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
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
                        value: dropdownvalue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Center(child: Text(items)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            getdata(newValue);
                            divsionvalue = 'ڈویژن';
                            dropdownvalue = newValue ?? "";
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: 'تحصیل',
                      hint: 'یہاں لکھیں۔',
                      controler: ageController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: ' ضلع',
                      hint: 'یہاں لکھیں۔',
                      controler: genderController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.text,
                      fldltxt: 'صوبائی حلقہ',
                      hint: 'یہاں لکھیں۔',
                        onchange: (value){
                        if (value == paPrefix) {
                    pacontroller.text = "";
                    return;
                  }
               value.startsWith(paPrefix)
                     ?  pacontroller.text = value
                     : pacontroller.text = paPrefix + value;
                  pacontroller.selection = TextSelection.fromPosition(
                      TextPosition(
                          offset: pacontroller.text.length
                             ));
                      },

                      controler: pacontroller,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                    
                      keyboardType: TextInputType.number,
                      fldltxt: 'قومی حلقہ',
                      hint: 'یہاں لکھیں۔',
                      onchange: (value){
                        if (value == naPrefix) {
                    nacontroller.text = "";
                    return;
                  }
                 value.startsWith(naPrefix)
                     ?  nacontroller.text = value
                     : nacontroller.text = naPrefix + value;
                  nacontroller.selection = TextSelection.fromPosition(
                      TextPosition(
                          offset: nacontroller.text.length
                             ));
                      },

                      controler: nacontroller,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: 'وارڈ',
                      hint: 'یہاں لکھیں۔',
                      controler: ageController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: ' یوسی/وی سی',
                      hint: 'یہاں لکھیں۔',
                      controler: genderController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
              ],
            ),
             SizedBox(
                width: width * 1.0,
                child: CustomField(
                  fldltxt: 'پتہ',
                  hint: 'یہاں لکھیں۔',
                  controler: addressController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
            Material(
              child: Checkbox(
                value: agree,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    agree = value ?? false;
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'میں نے تحریک لبیک یا رسول اللہ صلی اللہ علیہ وآلہ وسلم کے اغراض و مقاصد کا مطالعہ کر لیا ہے اور مجھے ان سے مکمل اتفاق ہے۔ میں عہد کرتا/کرتی ہوں کہ تحریک لبیک یا رسول اللہ صلی اللہ علیہ وآلہ وسلم کے اغراض و مقاصد اور منشور(اسلام، پاکستان اور عوام)کی کامیابی کے لئے دل و جان سے کوشش کروں گا/گی اور ان اغراض و مقاصد کے خلاف سرگرمیوں سے مکمل اجتناب کروں گا/گی۔',
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24).copyWith(top: 30),
              child: !isLoading
                  ? Center(
                      child: ElevatedButton(
                          onPressed: agree ? () {} : null,
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 20),
                          )),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ]),
        ),
      ),
    );
  }
}
