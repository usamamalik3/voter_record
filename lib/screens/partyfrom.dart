import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:voterrecord/models/database_service.dart';
import 'package:voterrecord/models/voter.dart';

class PartyForm extends StatefulWidget {
  const PartyForm({Key? key}) : super(key: key);
 
  @override
  State<PartyForm> createState() => _PartyFormState();
}

class _PartyFormState extends State<PartyForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController snoController = TextEditingController();
  TextEditingController hnoController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController pollingstController = TextEditingController();
  bool isLoading = false;
 bool agree = false;
  final _formKey = GlobalKey<FormState>();
String? dropdownvalue;
String? divsionvalue;
List<dynamic> divisons = [];
 getdata(distric) async{
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
    var items = [
      'پنجاب',
      'سندھ',
      'بلوچستان',
      'خیبر پختونخوا',
      'گلگت بلتستان',
      'آزاد جموں و کشمیر',
    ];
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
                      fldltxt: 'عمر',
                      hint: 'یہاں لکھیں۔',
                      controler: hnoController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      fldltxt: ' ووٹ نمبر',
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
                      fldltxt: 'تعلیم',
                      hint: 'یہاں لکھیں۔',
                      controler: ageController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: 'بلڈ گروپ',
                      hint: 'یہاں لکھیں۔',
                      controler: genderController,
                      validattor: RequiredValidator(errorText: "Required"),
                    ))
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
            SizedBox(
                width: width * 1.0,
                child: CustomField(
                  keyboardType: TextInputType.number,
                  fldltxt: 'موبائل نمبر',
                  hint: 'یہاں لکھیں۔',
                  controler: pollingstController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
            SizedBox(
                width: width * 1.0,
                child: CustomField(
                  keyboardType: TextInputType.number,
                  fldltxt: 'واٹس ایپ نمبر',
                  hint: 'یہاں لکھیں۔',
                  controler: pollingstController,
                  validattor: RequiredValidator(errorText: "Required"),
                )),
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only(right: 8,),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "صوبہ",
                      style: TextStyle(fontFamily: "NotoNastaliqUrdu"),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.greenAccent
                      .withOpacity(.3), //background color of dropdown button

                  borderRadius: BorderRadius.circular(
                      12), //border raiuds of dropdown button
                ),
                child: DropdownButton(
                  alignment: AlignmentDirectional.bottomEnd,
                  
                  value: dropdownvalue,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
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
             const ListTile(
              title: Padding(
                padding: EdgeInsets.only(right: 8, ),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "ڈویژن",
                      style: TextStyle(fontFamily: "NotoNastaliqUrdu"),
                    )),
              ),
            ),


          //TODO is ko check krna is mai baqi sb thek hy lakin jab division select kr k dobara
          // province change krty hain tu item is null error ata hy baqi voice pe bta don ga
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.greenAccent
                      .withOpacity(.3), //background color of dropdown button

                  borderRadius: BorderRadius.circular(
                      12), //border raiuds of dropdown button
                ),
                child: DropdownButton(
                  alignment: AlignmentDirectional.bottomEnd,
                  
                  value: divsionvalue,
                  items: divisons.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e.toString()),
                  );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      divsionvalue = newValue.toString() ;
                    });
                  },
                ),
              ),
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
                      keyboardType: TextInputType.number,
                      fldltxt: 'صوبائی حلقہ',
                      hint: 'یہاں لکھیں۔',
                      controler: ageController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: 'قومی حلقہ',
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
                      keyboardType: TextInputType.number,
                      fldltxt: 'وارڈ',
                      hint: 'یہاں لکھیں۔',
                      controler: ageController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 0.5,
                    child: CustomField(
                      fldltxt: 'علاقہ',
                      hint: 'یہاں لکھیں۔',
                      controler: genderController,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
              ],
            ),
             
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
              padding:  EdgeInsets.symmetric(horizontal: 15),
              child:  Text(
               
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
                          onPressed: agree ? (){} : null,
                            
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
