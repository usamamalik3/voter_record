import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:voterrecord/global/widgets/readonlytextfield.dart';

import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:voterrecord/models/database_service.dart';
import 'package:voterrecord/models/partyformModel.dart';
import 'package:intl/intl.dart';

import '../../utils/dropdown_list.dart';

class PartyForm extends StatefulWidget {
  const PartyForm({Key? key}) : super(key: key);

  @override
  State<PartyForm> createState() => _PartyFormState();
}

var maskFormatter = MaskTextInputFormatter(
  mask: '#####-#######-#',
  filter: {"#": RegExp(r'[0-9]')},
);
var phonemaskFormatter = MaskTextInputFormatter(
    mask: '####-#######', filter: {"#": RegExp(r'[0-9]')});
bool isLoading = false;
bool agree = false;

TextEditingController farmnoController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController fnameController = TextEditingController();
TextEditingController cnicController = TextEditingController();

TextEditingController ageController = TextEditingController();
TextEditingController eduController = TextEditingController();
TextEditingController instituteController = TextEditingController();
TextEditingController mobController = TextEditingController();
TextEditingController whatsappController = TextEditingController();
TextEditingController zoneController = TextEditingController();
TextEditingController tehsilController = TextEditingController();
TextEditingController districtController = TextEditingController();

TextEditingController genderController = TextEditingController();

TextEditingController dateInput = TextEditingController();
TextEditingController nacontroller = TextEditingController();
TextEditingController pacontroller = TextEditingController();
TextEditingController uccontroller = TextEditingController();
TextEditingController wardcontroller = TextEditingController();
TextEditingController addressController = TextEditingController();

const String naPrefix = "NA-";
String? paPrefix;
String? proffession;
void prefix(dropdownvalue) {
  switch (dropdownvalue) {
    case "??????????":
      {
        paPrefix = "PP-";
      }
      break;

    case "????????":
      {
        paPrefix = "PS-";

        //statements;
      }
      break;
    case "???????? ????????????????":
      {
        paPrefix = "PK-";
      }
      break;
    case "????????????????":
      {
        paPrefix = "PB-";
      }
      break;

    default:
      {
        //statements;
      }
      break;
  }
}

String? provincevalue;
String? zonevalue;
String? blddropdownvalue;
String? genderr;
String? divsionvalue;
String? districtvalue;
String? professionvalue;
List<String> profession= ["??????????????","????????","??????????????","???????????? ??????????","???????? ????????","???????????????? ??????????","??????????????","???????? ??????????????","???????? ??????","???? ???????????? ???? ????????"];
List<dynamic> divisons = [];
List<dynamic> district = [];
List<dynamic> zone = [];
 String? formno;
void clear() {
  TextEditingController().clear();
  provincevalue = null;
  divsionvalue = null;
  zonevalue = null;
  blddropdownvalue = null;
  genderr = null;
  districtvalue = null;
  bool agree = false;
  farmnoController.clear();
  nameController.clear();
  fnameController.clear();
  cnicController.clear();
  ageController.clear();
  eduController.clear();
  instituteController.clear();
  mobController.clear();
  whatsappController.clear();
  zoneController.clear();
  tehsilController.clear();
  districtController.clear();
  genderController.clear();
  dateInput.clear();
  nacontroller.clear();
  pacontroller.clear();
  uccontroller.clear();
  wardcontroller.clear();
  addressController.clear();
}

class _PartyFormState extends State<PartyForm> {
  final _formKey = GlobalKey<FormState>();
  formnomethod() async {
      QuerySnapshot qSnap = await FirebaseFirestore.instance.collection('PartyMember').get();
      final int documents = qSnap.docs.length;
       setState(() {
       formno = (documents+1).toString();
      });
   
  }

  getdivsions(province) async {
    await FirebaseFirestore.instance
        .collection("Divsion")
        .doc(province)
        .get()
        .then((value) {
      setState(() {
        divisons = value.data()!["??????????"];
      });
    });
  }

  getzone(province) async {
    await FirebaseFirestore.instance
        .collection("Zone")
        .doc(province)
        .get()
        .then((value) {
      setState(() {
        zone = value.data()!["??????"];
      });
    });
  }

  getdistrict(divsion) async {
    await FirebaseFirestore.instance
        .collection("District")
        .doc(divsion)
        .get()
        .then((value) {
      setState(() {
        district = value.data()!["??????"];
      });
    });
  }

  @override
  initState() {
    super.initState();
    getdivsions("??????????");
    getdistrict(divsionvalue);
    formnomethod();
    // getzone("??????????");
    prefix(provincevalue);
    
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0Xff008000),
        title: const Center(child: Text("?????????? ????????")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const ListTile(
              title: Center(
                  child: Text(
                "?????????? ???????? ??????????????",
                style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 18),
              )),
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.5,
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "??????",
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
                    width: width * 0.5,
                    child: ReadTextField(value: formno??"", title: "???????? ????????")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: '??????????/??????????',
                      hint: '???????? ????????????',
                      controler: fnameController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: '???????? ??????',
                      hint: '???????? ????????????',
                      controler: nameController,
                      validattor: RequiredValidator(errorText: "Required"),
                    ))
              ],
            ),
            SizedBox(
                width: width * 1,
                child: CustomField(
                  inputFormatter: [maskFormatter],
                  keyboardType: TextInputType.number,
                  fldltxt: '???????????? ????????',
                  hint: ' ???????????? ???????? ???????? ????????????',
                  controler: cnicController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: '??????',
                      hint: '???????? ????????????',
                      controler: ageController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: ReadTextField(
                      title: '?????????? ????????????',
                      value: '???????? ????????????',
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
                      keyboardType: TextInputType.text,
                      fldltxt: '??????????',
                      hint: '???????? ????????????',
                      controler: eduController,
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
                          "?????? ????????",
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
                  fldltxt: '??????????/????????/??????????????????/??????????',
                  hint: '???????? ????????????',
                  controler: instituteController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
            // Padding(
            //     padding: const EdgeInsets.only(left: 40, right: 5),
            //     child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: [
            //           const ListTile(
            //             title: Padding(
            //               padding: EdgeInsets.only(
            //                 right: 8,
            //               ),
            //               child: Align(
            //                   alignment: Alignment.topRight,
            //                   child: Text(
            //                     "????????????",
            //                     style:
            //                         TextStyle(fontFamily: "NotoNastaliqUrdu"),
            //                   )),
            //             ),
            //           ),
            //           Row(
            //             children: [
            //               Expanded(
            //                 child: ConstrainedBox(
            //                   constraints: const BoxConstraints(
            //                     maxWidth: 200,
            //                   ),
            //                   child: RadioListTile(
            //                     contentPadding: const EdgeInsets.all(0.0),
            //                     title: const Text('????????????'),
            //                     value: profession[0],
            //                     groupValue: proffession,
            //                     onChanged: (value) {
            //                       setState(() {
            //                         proffession = value.toString();
            //                       });
            //                     },
            //                   ),
            //                 ),
            //               ),
            //               Expanded(
            //                 child: ConstrainedBox(
            //                   constraints: const BoxConstraints(
            //                     maxWidth: 200,
            //                   ),
            //                   child: RadioListTile(
            //                     contentPadding: const EdgeInsets.all(0.0),
            //                     title: const Text('??????????????'),
            //                     value: profession[1],
            //                     groupValue: proffession,
            //                     onChanged: (value) {
            //                       setState(() {
            //                         proffession = value.toString();
            //                       });
            //                     },
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Expanded(
            //                 child: ConstrainedBox(
            //                   constraints: const BoxConstraints(
            //                     maxWidth: 200,
            //                   ),
            //                   child: RadioListTile(
            //                     contentPadding: const EdgeInsets.all(0.0),
            //                     title: const Text('??????????????'),
            //                     value: profession[2],
            //                     groupValue: proffession,
            //                     onChanged: (value) {
            //                       setState(() {
            //                         proffession = value.toString();
            //                       });
            //                     },
            //                   ),
            //                 ),
            //               ),
            //               Expanded(
            //                 child: ConstrainedBox(
            //                   constraints: const BoxConstraints(
            //                     maxWidth: 200,
            //                   ),
            //                   child: RadioListTile(
            //                     dense: true,
            //                     contentPadding: const EdgeInsets.all(0.0),
            //                     title: const Text('????????????'),
            //                     value: profession[3],
            //                     groupValue: proffession,
            //                     onChanged: (value) {
            //                       setState(() {
            //                         proffession = value.toString();
            //                       });
            //                     },
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ])),
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
                            "????????????",
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
                        value: professionvalue,
                        items: profession.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Center(child: Text(e.toString())),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            professionvalue = newValue.toString();
                          
                          });
                        },
                      ),
                    ),
                  ),
                ),
            Row(
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      inputFormatter: [phonemaskFormatter],
                      keyboardType: TextInputType.number,
                      fldltxt: '???????? ?????? ????????',
                      hint: '???????? ????????????',
                      controler: whatsappController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      inputFormatter: [phonemaskFormatter],
                      keyboardType: TextInputType.phone,
                      fldltxt: '???????????? ????????',
                      hint: '???????? ????????????',
                      controler: mobController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SizedBox(
                //   width: width * 0.5,
                //   child: ListTile(
                //     title: const Padding(
                //       padding: EdgeInsets.only(
                //         right: 8,
                //       ),
                //       child: Align(
                //           alignment: Alignment.topRight,
                //           child: Text(
                //             "??????",
                //             style: TextStyle(fontFamily: "NotoNastaliqUrdu"),
                //           )),
                //     ),
                //     subtitle: DecoratedBox(
                //       decoration: BoxDecoration(
                //         color: Colors.greenAccent.withOpacity(
                //             .3), //background color of dropdown button

                //         borderRadius: BorderRadius.circular(
                //             12), //border raiuds of dropdown button
                //       ),
                //       child: DropdownButton(
                //         underline: const SizedBox.shrink(),
                //         iconEnabledColor: Theme.of(context).primaryColor,
                //         isExpanded: true,
                //         alignment: AlignmentDirectional.bottomEnd,
                //         value: zonevalue,
                //         items: zone.map((zon) {
                //           return DropdownMenuItem(
                //             value: zon,
                //             child: Center(child: Text(zon.toString())),
                //           );
                //         }).toList(),
                //         onChanged: (newValue) {
                //           setState(() {
                //             zonevalue = newValue.toString();
                //           });
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //     width: width * 0.5,
                //     child: CustomField(
                //       keyboardType: TextInputType.text,
                //       fldltxt: '??????',
                //       hint: '???????? ????????????',
                //       controler: zoneController,
                //       validattor: RequiredValidator(errorText: "Required"),
                //     )),
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
                            "??????????",
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
                            getdistrict(divsionvalue);
                            districtvalue = null;
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
                            "????????",
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
                            getdivsions(newValue);
                            getzone(newValue);
                            divsionvalue = null;
                            zonevalue = null;
                            provincevalue = newValue ?? "";
                            prefix(provincevalue);
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
                      keyboardType: TextInputType.text,
                      fldltxt: '??????????',
                      hint: '???????? ????????????',
                      controler: tehsilController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
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
                            "??????",
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
                        hint: Text(""),
                        underline: const SizedBox.shrink(),
                        iconEnabledColor: Theme.of(context).primaryColor,
                        isExpanded: true,
                        alignment: AlignmentDirectional.bottomEnd,
                        value: districtvalue,
                        items: district.map((dis) {
                          return DropdownMenuItem(
                            value: dis,
                            child: Center(child: Text(dis.toString())),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            districtvalue = newValue.toString();
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
                      fldltxt: '???????????? ????????',
                      hint: '???????? ????????????',
                      onchange: (value) {
                        if (value == paPrefix) {
                          pacontroller.text = "";
                          return;
                        }
                        value.startsWith(paPrefix!)
                            ? pacontroller.text = value
                            : pacontroller.text = (paPrefix! + value);
                        pacontroller.selection = TextSelection.fromPosition(
                            TextPosition(offset: pacontroller.text.length));
                      },
                      controler: pacontroller,
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: '???????? ????????',
                      hint: '???????? ????????????',
                      onchange: (value) {
                        if (value == naPrefix) {
                          nacontroller.text = "";
                          return;
                        }
                        value.startsWith(naPrefix)
                            ? nacontroller.text = value
                            : nacontroller.text = naPrefix + value;
                        nacontroller.selection = TextSelection.fromPosition(
                            TextPosition(offset: nacontroller.text.length));
                      },
                      controler: nacontroller,
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
                      fldltxt: '????????',
                      hint: '???????? ????????????',
                      controler: wardcontroller,
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.text,
                      fldltxt: ' ????????/???? ????',
                      hint: '???????? ????????????',
                      controler: uccontroller,
                    )),
              ],
            ),
            SizedBox(
                width: width * 1.0,
                child: CustomField(
                  fldltxt: '??????',
                  hint: '???????? ????????????',
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
                '?????? ???? ?????????? ???????? ???? ???????? ???????? ?????? ???????? ???????? ???????? ???????? ???? ?????????? ?? ?????????? ???? ???????????? ???? ?????? ???? ?????? ???????? ???? ???? ???????? ?????????? ?????? ?????? ?????? ????????/???????? ?????? ???? ?????????? ???????? ?????????????? ???? ?????????? ?? ?????????? ?????? ??????????(???????????? ?????????????? ?????? ????????)???? ?????????????? ???? ?????? ???? ?? ?????? ???? ???????? ???????? ????/???? ?????? ???? ?????????? ?? ?????????? ???? ???????? ???????????????? ???? ???????? ???????????? ???????? ????/??????',
                maxLines: 7,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "NotoNastaliqUrdu",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24).copyWith(top: 30),
              child: !isLoading
                  ? Center(
                      child: ElevatedButton(
                          onPressed: agree
                              ? () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      DatabaseService databaseService =
                                          DatabaseService();
                                      PartyMemberform partyMemberform =
                                          PartyMemberform(
                                        farmno: formno,
                                        name: nameController.text,
                                        fathername: fnameController.text,
                                        cnic: cnicController.text,
                                        dob: dateInput.text,
                                        age: int.parse(ageController.text),
                                        edu: eduController.text,
                                        institute: instituteController.text,
                                        bloodgroup: blddropdownvalue,
                                        profession: professionvalue,
                                        mobile: mobController.text,
                                        whatsapp: whatsappController.text,
                                        province: provincevalue,
                                        zone: zonevalue,
                                        divison: divsionvalue,
                                        district: districtvalue,
                                        tehsil: tehsilController.text,
                                        na: nacontroller.text,
                                        pp: pacontroller.text,
                                        uc: uccontroller.text,
                                        gender: genderr,
                                        ward: wardcontroller.text,
                                        address: addressController.text,
                                      );
                                      setState(() {
                                        isLoading = true;
                                      });

                                      await databaseService
                                          .addmember(partyMemberform);
                                      Fluttertoast.showToast(
                                          msg: "voter added successfully",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black,
                                          fontSize: 16.0);
                                    } catch (e) {
                                      Fluttertoast.showToast(
                                          msg: "somthing wrong",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black,
                                          fontSize: 16.0);
                                    }
                                    setState(() {
                                      isLoading = false;
                                      clear();
                                    });
                                  }
                                }
                              : null,
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
