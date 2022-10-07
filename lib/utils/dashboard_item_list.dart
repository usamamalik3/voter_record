import 'package:flutter/material.dart';
import 'package:voterrecord/models/dashboardItem.dart';

List<Items> myList = [
  Items(
      title: "رجسٹریشن فارم",
      icon: const Icon(
        Icons.add_circle_outline,
        size: 50,
      ),
      onPressed: (context) {
        Navigator.pushNamed(context, '/register');
      }),
  Items(
    title: " تنظیم سازی",
    icon: const Icon(
      Icons.group_outlined,
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
      
    },
  ),
  Items(
    title: "شماریات",
    icon: const Icon(
      Icons.document_scanner_outlined,
      size: 50,
    ),
    onPressed: (context) {},
  ),
  Items(
      title: "میڈیا",
      icon: const Icon(
        Icons.perm_media_outlined,
        size: 50,
      ),
      onPressed: (context) {}),
  Items(
      title: "شعبه جات",
      icon: const Icon(
        Icons.contact_page_outlined,
        size: 50,
      ),
      onPressed: (context) {}),
  Items(
      title: "ہمارے بارے میں",
      icon: const Icon(
        Icons.contact_page_outlined,
        size: 50,
      ),
      onPressed: (context) {}),
  Items(
      title: "ڈاکیومنٹ",
      icon: const Icon(
        Icons.contact_page_outlined,
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
