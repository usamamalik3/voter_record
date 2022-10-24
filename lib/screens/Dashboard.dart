import 'package:flutter/material.dart';
import 'package:voterrecord/utils/container_menu.dart';

import 'package:voterrecord/utils/dashboard_item_list.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: const Text("Dashboard"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 72, 163, 75),
                Color.fromARGB(255, 17, 121, 5)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            ContainerMenu(list: myList, crossAxisSpacing: 16, mainAxisSpacing: 16, crossAxisCount: 2, childAspectRatio: 0.90)
          ],
        ),
      ),
    );
  }

  ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
    ),
  );

  Widget kBackBtn = const Icon(
    Icons.arrow_back_ios,
    // color: Colors.black54,
  );
}
