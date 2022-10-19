import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:voterrecord/models/database_service.dart';
import 'package:voterrecord/models/voter.dart';
import 'package:voterrecord/utils/dropdown_list.dart';

class AddVoterData extends StatefulWidget {
  const AddVoterData({Key? key}) : super(key: key);

  @override
  State<AddVoterData> createState() => _AddVoterDataState();
}

class _AddVoterDataState extends State<AddVoterData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController snoController = TextEditingController();
  TextEditingController hnoController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController pollingstController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController stcodeController = TextEditingController();
  bool isLoading = false;
  String? genderr;

  var maskFormatter = MaskTextInputFormatter(
    mask: '#####-#######-#',
    filter: {"#": RegExp(r'[0-9]')},
  );
  var phonemaskFormatter = MaskTextInputFormatter(
      mask: '####-#######', filter: {"#": RegExp(r'[0-9]')});
  

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0Xff008000),
        title: const Center(child: Text("ووٹر شامل کریں")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
                width: width * 1.0,
                child: CustomField(
                  keyboardType: TextInputType.number,
                  fldltxt: 'شماریاتی کوڈ',
                  hint: 'یہاں لکھیں۔',
                  controler: stcodeController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: 'والد/شوہر',
                      hint: 'یہاں لکھیں۔',
                      controler: fnameController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: 'نام',
                      hint: 'یہاں لکھیں۔',
                      controler: nameController,
                      validattor: RequiredValidator(errorText: "Required"),
                    ))
              ],
            ),
            Row(
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      inputFormatter: [maskFormatter],
                      keyboardType: TextInputType.number,
                      fldltxt: 'شناختی کارڈ',
                      hint: 'یہاں لکھیں۔',
                      controler: cnicController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                     SizedBox(
                width: width * 0.5,
                child: CustomField(
                  inputFormatter: [phonemaskFormatter],
                  keyboardType: TextInputType.number,
                  fldltxt: 'فون نمبر',
                  hint: 'یہاں لکھیں۔',
                  controler: phonenoController,
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
                      fldltxt: 'سلسلہ نمبر',
                      hint: 'یہاں لکھیں۔',
                      controler: snoController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: 'گھرانہ نمبر',
                      hint: 'یہاں لکھیں۔',
                      controler: hnoController,
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
            SizedBox(
                width: width * 1.0,
                child: CustomField(
                  fldltxt: 'پولنگ سٹیشن',
                  hint: 'یہاں لکھیں۔',
                  controler: pollingstController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
                
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24).copyWith(top: 30),
              child: !isLoading
                  ? Center(
                      child: ElevatedButton(
                          onPressed: (() async {
                            if (_formKey.currentState!.validate()) {
                              DatabaseService service = DatabaseService();

                              Voter voter = Voter(
                                  name: nameController.text,
                                  fathername: fnameController.text,
                                  cnic: cnicController.text,
                                  serialno: int.parse(snoController.text),
                                  householdno: int.parse(hnoController.text),
                                  gender: genderr,
                                  age: int.parse(ageController.text),
                                  address: addressController.text,
                                  polingstion: pollingstController.text,
                                  stcode: stcodeController.text,
                                  phonrno: phonenoController.text,
                                  );

                              setState(() {
                                isLoading = true;
                              });
                              await service.addVoter(voter);
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }),
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
