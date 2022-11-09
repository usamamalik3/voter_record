import "package:flutter/material.dart";

import 'package:voterrecord/utils/container_menu.dart';

import 'package:voterrecord/utils/list_utils.dart';

class Election extends StatelessWidget {
  const Election({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerMenu(
              childAspectRatio: 0.90,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              list: electionItemlist,
              mainAxisSpacing: 16,
            ),
          ],
        ),
      ),
    );
  }
}
