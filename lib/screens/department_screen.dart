import"package:flutter/material.dart";
import 'package:voterrecord/utils/container_menu.dart';
import 'package:voterrecord/utils/dashboard_item_list.dart';
import 'package:voterrecord/utils/list_utils.dart';

class Department extends StatelessWidget {
  const Department({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
          ContainerMenu(list: departmentlist, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2, childAspectRatio: 1.5)
          ],
        ),
      ),
    );
  }
}