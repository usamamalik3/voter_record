import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatelessWidget {
   CustomField({
    Key? key,
    required this.hint,
    required this.fldltxt,
    required this.controler,
    this.validattor,
    this.keyboardType, this.inputFormatter,
    this.onchange,this.obscureText,this.suffixicon
  }) : super(key: key);

  final String hint;
  final String fldltxt;
  final bool? obscureText;
  final TextEditingController controler;
  final String? Function(String?)? validattor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>?  inputFormatter;
  final Widget? suffixicon;
  Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 4),
          child: Align(
              alignment: Alignment.topRight,
              child: Text(
                fldltxt,
                style: const TextStyle(fontFamily: "NotoNastaliqUrdu"),
              )),
        ),
        minLeadingWidth: 8.0,
        subtitle: TextFormField(
         
          obscureText: obscureText==false,
          onChanged: onchange,
          inputFormatters: inputFormatter,
          keyboardType: keyboardType,
          controller: controler,
          validator: validattor,
          textAlign: TextAlign.right,
          cursorColor: Theme.of(context).primaryColor,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            
            prefixIcon: suffixicon,
            
        
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
