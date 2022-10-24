import 'package:flutter/material.dart';
import 'package:voterrecord/utils/container_menu.dart';
import 'package:voterrecord/utils/list_utils.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
         padding: const EdgeInsets.only(top: 200.0),
        child: Column(
          children: [
            ContainerMenu(list: contactusList, crossAxisSpacing: 16, mainAxisSpacing: 16, crossAxisCount: 2, childAspectRatio: 0.90),
          ],
        ),
      ),
    );
  }
}