import 'package:flutter/material.dart';
import 'package:voterrecord/global/widgets/textfield.dart';

class AddOfficials extends StatefulWidget {
  const AddOfficials({super.key});

  @override
  State<AddOfficials> createState() => _AddOfficialsState();
}

class _AddOfficialsState extends State<AddOfficials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // CustomField(hint: hint, fldltxt: fldltxt, controler: controler),
          //  CustomField(hint: hint, fldltxt: fldltxt, controler: controler),
        ],
      ),
    );
  }
}