

import 'package:flutter/material.dart';
import 'package:voterrecord/utils/list_utils.dart';

import '../../utils/container_menu.dart';


class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerMenu(
              childAspectRatio: 0.90,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              list: educationlist,
              mainAxisSpacing: 16,
            ),
          ],
        ),
      ),
    );
 
  }
}