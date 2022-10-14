import 'package:flutter/material.dart';
import 'package:voterrecord/models/dashboardItem.dart';

List<Items> myList = [
  Items(
      title: " ٹی ایل پی کے بارے میں",
      icon: const Icon(
        Icons.info_outline,
        size: 50,
      ),
      onPressed: (context) {

      }),
      Items(
      title: "رجسٹریشن فارم",
      icon: const Icon(
        Icons.add_circle_outline,
        size: 50,
      ),
      onPressed: (context) {
        Navigator.pushNamed(context, '/partyform');
      }),
  Items(
    title: " تنظیم سازی",
    icon: const Icon(
      Icons.group_outlined,
      size: 50,
    ),
    onPressed: (context) {
       
    },
  ),
 
  Items(
      title: "شعبه جات",
      icon: const Icon(
        Icons.account_tree_outlined,
        size: 50,
      ),
      onPressed: (context) {}),
  Items(
    title: "شماریات",
    icon: const Icon(
      Icons.auto_graph_outlined,
      size: 50,
    ),
    onPressed: (context) {},
  ),
   Items(
    title: "ووٹر پرچی",
    icon: const Icon(
      Icons.list_alt_outlined,
      size: 50,
    ),
    onPressed: (context) {
 Navigator.pushNamed(context, '/voter');
     
      
    },
  ),
   Items(
    title: "الیکشن مینجمنٹ سسٹم",
    icon: const Icon(
      Icons.manage_history_outlined,
      size: 50,
    ),
    onPressed: (context) {
     
     
      
    },
  ),

Items(
      title: "ڈاکیومنٹ",
      icon: const Icon(
        Icons.document_scanner_outlined,
        size: 50,
      ),
      onPressed: (context) {}),
       Items(
      title: "میڈیا",
      icon: const Icon(
        Icons.perm_media_outlined,
        size: 50,
      ),
      onPressed: (context) {}),
  Items(
      title: "ہم سے رابطہ کریں",
      icon: const Icon(
        Icons.contact_page_outlined,
        size: 50,
      ),
      onPressed: (context) {}),
];
