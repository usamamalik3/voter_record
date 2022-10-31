import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:voterrecord/screens/partyfrom.dart';

class AddOffice extends StatefulWidget {
  const AddOffice({super.key});

  @override
  State<AddOffice> createState() => _AddOfficeState();
}
String? _uploadedFileURL;

class _AddOfficeState extends State<AddOffice> {
  File? _image;
  
  final picker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  Future chooseFile() async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedfile!.path);
    });
    Reference reference =
        FirebaseStorage.instance.ref().child(_image.toString());
    UploadTask uploadTask = reference.putFile(_image!);
    TaskSnapshot snapshot = await uploadTask;
    _uploadedFileURL = await snapshot.ref.getDownloadURL();
    print(_uploadedFileURL);
  }

//  uploadProfileImage() async {

//     print(_uploadedFileURL);
//   }

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactno = TextEditingController();

  List category=[
    "divsion",
    "main",
    "zone",
    "District",

    
  ];
  String? _selectedValue;

  final _formKey = GlobalKey<FormState>();
  add() async {
    try {
      await FirebaseFirestore.instance.collection("Office").doc().set({
        "Name": name.text,
        "image": _uploadedFileURL,
        "Address": address.text,
        "Contactno": contactno.text,
        "Category": _selectedValue,
      }).then(
        (value) => Fluttertoast.showToast(
            msg: "office added successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0),
      );
    } on PlatformException catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "something went wrong",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          fontSize: 18.0);
      return;
    }
  }


  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text('add office')),
      ),
      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
              child: Column(
        children: [
            SizedBox(
                    width: width * 1.0,
                    child: CustomField(
                      fldltxt: 'Office name',
                      hint: 'یہاں لکھیں۔',
                      controler: name,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                     SizedBox(
                    width: width * 1.0,
                    child: CustomField(
                      fldltxt: 'Office address',
                      hint: 'یہاں لکھیں۔',
                      controler: address,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                     SizedBox(
                    width: width * 1.0,
                    child: CustomField(
                      keyboardType: TextInputType.number,
                      inputFormatter: [phonemaskFormatter],
                      fldltxt: 'Office contact',
                      hint: 'یہاں لکھیں۔',
                      controler: contactno,
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
                          "Category",
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
                        value: _selectedValue,
                        items: category.map(( cat) {
                          return DropdownMenuItem(
                            value: cat,
                            child: Center(child: Text(cat)),
                          );
                        }).toList(),
                        onChanged: ( newValue) {
                          setState(() {
                            _selectedValue = newValue.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                   _image != null    
               ? Image.file(    
                   _image!,    
                   height: 150,    
                 )    
               : const Text("No image selcted"),    
           _image == null    
               ?  ElevatedButton(    
                   onPressed: chooseFile,   
                   style: ElevatedButton.styleFrom(
                  
                   ),    
                   child: const Text('Choose File'), 
                       
                 ):
                 Container(),
                 const SizedBox(height: 20,),

                 Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24).copyWith(top: 30),
              child: !isLoading
                  ? Center(
                      child: ElevatedButton(
                          onPressed: 
                               () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                   add();
                                    setState(() {
                                      isLoading = false;
                                
                                    });
                                  }
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
      ))),
    );
  }
}
