import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  void clear(){
    
    nameController.clear();
   fnameController.clear(); 
   cnicController.clear();
   addressController.clear(); 
   snoController.clear(); 
   hnoController.clear();
   genderController.clear();
   ageController.clear(); 
   pollingstController.clear();
   phonenoController.clear(); 
   stcodeController.clear(); 
  }

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
        title: const Center(child: Text("???????? ???????? ????????")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
                width: width * 1.0,
                child: CustomField(
                  keyboardType: TextInputType.number,
                  fldltxt: '???????????????? ??????',
                  hint: '???????? ????????????',
                  controler: stcodeController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: '????????/????????',
                      hint: '???????? ????????????',
                      controler: fnameController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: '??????',
                      hint: '???????? ????????????',
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
                      fldltxt: '???????????? ????????',
                      hint: '???????? ????????????',
                      controler: cnicController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                     SizedBox(
                width: width * 0.5,
                child: CustomField(
                  inputFormatter: [phonemaskFormatter],
                  keyboardType: TextInputType.number,
                  fldltxt: '?????? ????????',
                  hint: '???????? ????????????',
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
                      fldltxt: '?????????? ????????',
                      hint: '???????? ????????????',
                      controler: snoController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: '???????????? ????????',
                      hint: '???????? ????????????',
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
                      fldltxt: '??????',
                      hint: '???????? ????????????',
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
            SizedBox(
                width: width * 1.0,
                child: CustomField(
                  fldltxt: '?????????? ??????????',
                  hint: '???????? ????????????',
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
                              clear();
                               Fluttertoast.showToast(
                                          msg: "voter added successfully",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black,
                                          fontSize: 16.0);
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
