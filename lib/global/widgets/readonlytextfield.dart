import 'package:flutter/material.dart';


class ReadTextField extends StatelessWidget {
  const ReadTextField({super.key, required this.value, required this.title, this.controler, this.ontap});

  final String value;
  final String title;
  final TextEditingController? controler;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 2),
          child: Align(
              alignment: Alignment.topRight,
              child: Text(
                title,
                style: const TextStyle(fontFamily: "NotoNastaliqUrdu"),
              )),
        ),
        minLeadingWidth: 8.0,
        subtitle: TextFormField(
          controller: controler,
          onTap: ontap,
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