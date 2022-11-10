import 'package:flutter/cupertino.dart';

class Items {
  String title;
  Icon icon;
 Function(BuildContext context)  onPressed;
  
  Items({required this.title,  required this.icon, required this.onPressed});
}

class BodyItem{
   String title;
  
 
 BodyItem({required this.title, });

}