import 'package:flutter/material.dart';
import 'package:voterrecord/models/dashboardItem.dart';

List<Items> departmentlist = [
  Items(
      title: "شعبہ نشرواشاعت",
      icon: const Icon(
        Icons.cast_connected_outlined,
        size: 30,
      ),
      onPressed: (context) {}),
  Items(
      title: "شعبہ مالیات",
      icon: const Icon(
        Icons.currency_exchange_outlined,
        size: 30,
      ),
      onPressed: (context) {}),
  Items(
      title: "شعبہ رابطہ تنظیم",
      icon: const Icon(
        Icons.contact_phone_outlined,
        size: 30,
      ),
      onPressed: (context) {}),
  Items(
    title: "شعبہ خدمت خلق",
    icon: const Icon(
      Icons.handshake_outlined,
      size: 30,
    ),
    onPressed: (context) {},
  ),
  Items(
    title: "شعبہ قانونی معاملات",
    icon: const Icon(
      Icons.scale_outlined,
      size: 30,
    ),
    onPressed: (context) {},
  ),
  Items(
    title: "شعبہ رابطہ انتظامیہ",
    icon: const Icon(
      Icons.group_outlined,
      size: 30,
    ),
    onPressed: (context) {},
  ),
  Items(
      title: "شعبہ انتخابی اُمور",
      icon: const Icon(
        Icons.how_to_vote_rounded,
        size: 30,
      ),
      onPressed: (context) {}),
  Items(
    title: "شعبہ سیکورٹی معاملات",
    icon: const Icon(
      Icons.security_outlined,
      size: 30,
    ),
    onPressed: (context) {},
  ),
  Items(
      title: "شعبہ دفتری اُمور",
      icon: const Icon(
        Icons.local_post_office_outlined,
        size: 30,
      ),
      onPressed: (context) {}),
  Items(
      title: "شعبہ تحریکی ڈیزائننگ",
      icon: const Icon(
        Icons.design_services_outlined,
        size: 30,
      ),
      onPressed: (context) {}),
];

List<Items> electionItemlist = [
  Items(
      title: "صوبائی اسمبلی الیکشن",
      icon: const Icon(
        Icons.how_to_vote_outlined,
        size: 30,
      ),
      onPressed: (context) {}),
  Items(
      title: "قومی اسمبلی الیکشن",
      icon: const Icon(
        Icons.how_to_vote_outlined,
        size: 30,
      ),
      onPressed: (context) {}),
  Items(
      title: "انٹرا پارٹی الیکشن",
      icon: const Icon(
        Icons.how_to_vote_outlined,
        size: 30,
      ),
      onPressed: (context) {}),
  Items(
      title: "بلدیاتی الیکشن",
      icon: const Icon(
        Icons.how_to_vote_outlined,
        size: 30,
      ),
      onPressed: (context) {}),
];

List<Items> contactusList = [
  Items(
      title: "شکایات اور تجاویز",
      icon: const Icon(
        Icons.dashboard_customize,
        size: 30,
      ),
      onPressed: (context) {
        Navigator.pushNamed(context, '/complaint');
      }),
  Items(
      title: "دفاتر کی تفصیل",
      icon: const Icon(
        Icons.house_outlined,
        size: 30,
      ),
      onPressed: (context) {
        Navigator.pushNamed(context, '/officedetail');
      }),
];

List<Items> tanzeemSaziList = [
  Items(
      title: "پندرہ رکنی باڈی",
      icon: const Icon(
        Icons.group,
        size: 30,
      ),
      onPressed: (context) {
        Navigator.pushNamed(context, '/bodyscreen');
      }),
  Items(
      title: "میٹنگ شیڈول",
      icon: const Icon(
        Icons.video_call_outlined,
        size: 30,
      ),
      onPressed: (context) {
        Navigator.pushNamed(context, '/meeting');
      }),
];

List<BodyItem> zone = [
  BodyItem(title: "کےپی کے زون 1", onPressed: (context) {}),
  BodyItem(title: "کےپی کے زون 2", onPressed: (context) {}),
  BodyItem(title: "کےپی کے زون 3", onPressed: (context) {}),
  BodyItem(title: "شمالی پنجاب", onPressed: (context) {}),
  BodyItem(title: "جنوبی پنجاب", onPressed: (context) {}),
  BodyItem(title: "وسطی پنجاب", onPressed: (context) {}),
  BodyItem(title: "زون صوبہ سندھ", onPressed: (context) {}),
  BodyItem(title: "زون صوبہ بلوچستان", onPressed: (context) {}),
  BodyItem(title: "زون آزادکشمیر", onPressed: (context) {}),
  BodyItem(title: "زون گلگت بلتستان", onPressed: (context) {}),
];
