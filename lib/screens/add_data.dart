
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:voterrecord/models/database_service.dart';
import 'package:voterrecord/models/voter.dart';


class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController snoController = TextEditingController();
  TextEditingController hnoController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController pollingstController = TextEditingController();
  bool isLoading =false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0Xff008000),
        title: const Center(child: Text("Add detail")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            SizedBox(
                width: width * 1.0,
                child: CustomField(
                  keyboardType: TextInputType.number,
                  fldltxt: 'شناختی کارڈ',
                  hint: 'یہاں لکھیں۔',
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
                      fldltxt: 'گھرانہ نمبر',
                      hint: 'یہاں لکھیں۔',
                      controler: hnoController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: 'سلسلہ نمبر',
                      hint: 'یہاں لکھیں۔',
                      controler: snoController,
                      validattor: RequiredValidator(errorText: "Required"),
                    ))
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
                    child: CustomField(
                      fldltxt: 'جنس',
                      hint: 'یہاں لکھیں۔',
                      controler: genderController,
                      validattor: RequiredValidator(errorText: "Required"),
                    ))
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
                !isLoading
    ? Center(
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
      side:const  BorderSide(color: Color(0Xff0080))
    )
  ),
                minimumSize:MaterialStateProperty.all(const Size(200,50)),
                backgroundColor: MaterialStateProperty.all<
                        Color>(
                  const Color(0Xff008000))),
            onPressed: (() async {
                if (_formKey.currentState!.validate()) {
                DatabaseService service = DatabaseService();
                
               Voter voter = Voter(
                name:nameController.text,
                fathername: fnameController.text,
                cnic: cnicController.text,
                serialno: int.parse(snoController.text),
                householdno: int.parse(hnoController.text),
                gender: genderController.text,
                age:  int.parse(ageController.text),
                address: addressController.text,
                polingstion: pollingstController.text


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
            child: const Text("Submit",style: TextStyle(fontSize: 20),)),
        )
    : const Center(
        child: CircularProgressIndicator(),
        )
          ]),
        ),
      ),
    
    );
  }
}

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.hint,
    required this.fldltxt,
    required this.controler,
    this.validattor, this.keyboardType,
  }) : super(key: key);

  final String hint;
  final String fldltxt;
  final TextEditingController controler;
  final String? Function(String?)? validattor;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
          alignment: Alignment.topRight,
          child: Text(
            fldltxt,
            style: const TextStyle(fontFamily: "NotoNastaliqUrdu"),
          )),
      minLeadingWidth: 8.0,
      subtitle: TextFormField(
      
        keyboardType: keyboardType,
        controller: controler,
        validator: validattor,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
        
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          hintText: hint,
          
        ),
      ),
    );
  }
}
