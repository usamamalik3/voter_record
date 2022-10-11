import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReadTextField extends StatelessWidget {
  const ReadTextField({super.key, required this.value, required this.title});

  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 4),
          child: Align(
              alignment: Alignment.topRight,
              child: Text(
                title,
                style: const TextStyle(fontFamily: "NotoNastaliqUrdu"),
              )),
        ),
        minLeadingWidth: 8.0,
        subtitle: TextFormField(
          
          readOnly: true,
          
          textAlign: TextAlign.right,
          cursorColor: Theme.of(context).primaryColor,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: value,
            hintStyle:const  TextStyle(fontFamily: "NotoNastaliqUrdu"),
          ),
        ),
      ),
    );
  }
}