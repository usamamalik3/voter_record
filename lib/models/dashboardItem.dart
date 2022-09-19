import 'package:flutter/cupertino.dart';

class Items {
  String title;
  Icon icon;
 Function()  onPressed;
  
  Items({required this.title,  required this.icon, required this.onPressed});
}