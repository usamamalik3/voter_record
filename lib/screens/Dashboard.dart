import 'package:flutter/material.dart';
import 'package:voterrecord/models/dashboardItem.dart';
import 'package:voterrecord/screens/add_data.dart';
import 'package:voterrecord/screens/partyfrom.dart';
import 'package:voterrecord/screens/votersearch.dart';
import 'package:voterrecord/utils/dashboard_item_list.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

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
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  childAspectRatio: .90,
                  children: myList.map((data) {
                    return InkWell(
                      splashColor: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                      data.onPressed();
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              Theme.of(context).inputDecorationTheme.fillColor!,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            data.icon,
                            const SizedBox(height: 14),
                            Text(
                              data.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
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
