import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voterrecord/global/widgets/textfield.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;
import 'package:voterrecord/screens/PartyForm/partyfrom.dart';

class Complaint extends StatefulWidget {
  const Complaint({super.key});

  @override
  State<Complaint> createState() => _ComplaintState();
}

List<String> attachments = [];

class _ComplaintState extends State<Complaint> {
   TextEditingController nameecontroller = TextEditingController();
   TextEditingController subjectcontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController msgcontroller = TextEditingController();

    var contactfrom = [
      'شکایات',
      'تجاویز',
    ];
    void clear(){
      nameecontroller.clear();
      emailcontroller.clear();
      msgcontroller.clear();
      

    }
    String? dropdown;
    Future<void> send() async { 
      final Email email = Email(
        body: "${msgcontroller.text}\n\n\n from ${nameecontroller.text}\n email:${emailcontroller.text}"  ,
        subject: subjectcontroller.text,
        recipients: ["usama0834@gmail.com"],
        attachmentPaths: attachments,
      );

      String platformResponse;

      try {
        await FlutterEmailSender.send(email);
        platformResponse = 'success';
      } catch (error) {
        print(error);
        platformResponse = error.toString();
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(platformResponse),
        ),
      );
    }


    final formKey = GlobalKey<FormState>();
   
  @override
  Widget build(BuildContext context) {
       double width = MediaQuery.of(context).size.width;
     return Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text("شکایات یا تجاویز", style: TextStyle(fontFamily:"NotoNastaliqUrdu"),)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                    width: width * 1,
                    child: CustomField(
                      fldltxt: 'مکمل نام',
                      hint: 'یہاں لکھیں۔',
                      controler: nameecontroller,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                SizedBox(
                    width: width * 1,
                    child: CustomField(
                      keyboardType: TextInputType.emailAddress,
                      fldltxt: 'ای میل',
                      hint: 'یہاں لکھیں۔',
                      controler: emailcontroller,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                     SizedBox(
                    width: width * 1,
                    child: CustomField(
                      keyboardType: TextInputType.emailAddress,
                      fldltxt: 'عنوان',
                      hint: 'یہاں لکھیں۔',
                      controler: subjectcontroller,
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
                          "نوعیت",
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
                        value: dropdown,
                        items: contactfrom.map((contactfrom) {
                          return DropdownMenuItem(
                            value: contactfrom,
                            child: Center(child: Text(contactfrom)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdown = newValue ?? "";
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: width * 1,
                    child: CustomField(
                      maxline: 6,
                      keyboardType: TextInputType.emailAddress,
                      fldltxt: 'پیغام',
                      hint: 'یہاں لکھیں۔',
                      controler: msgcontroller,
                      validattor: RequiredValidator(errorText: "Required"),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      for (var i = 0; i < attachments.length; i++)
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                attachments[i],
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove_circle),
                              onPressed: () => {_removeAttachment(i)},
                            )
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                             TextButton(
                        child: const Text(
                            'فائل منسلک کریں'),
                        onPressed: () => _attachFileFromAppDocumentsDirectoy(),
                      ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(Icons.attach_file),
                              onPressed: _openImagePicker,
                            ),
                          ),
                        
                        ],
                      ),
                     
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24)
                      .copyWith(top: 30),
                  child: !isLoading
                      ? Center(
                          child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  send();

                                  setState(() {
                                    isLoading = true;
                                  });

                                  setState(() {
                                    isLoading = false;
                                  });
                                  clear();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openImagePicker() async {
    final picker = ImagePicker();
    XFile? pick = await picker.pickImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }

  Future<void> _attachFileFromAppDocumentsDirectoy() async {
    try {
      final appDocumentDir =
          await PathProvider.getApplicationDocumentsDirectory();
      final filePath = '${appDocumentDir.path}/file.txt';
      final file = File(filePath);
      await file.writeAsString('Text file in app directory');

      setState(() {
        attachments.add(filePath);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to create file in applicion directory'),
        ),
      );
    }
  }
}
