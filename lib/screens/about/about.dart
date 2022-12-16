

import 'package:flutter/material.dart';
import 'package:voterrecord/utils/container_menu.dart';
import 'package:voterrecord/utils/list_utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerMenuWithTap(
              childAspectRatio: 1.2,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              list: aboutlist,
              mainAxisSpacing: 16,
            ),
          ],
        ),
      ),
    );
 
  }
}