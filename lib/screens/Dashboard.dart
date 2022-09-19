import 'package:flutter/material.dart';
import 'package:voterrecord/models/dashboardItem.dart';
import 'package:voterrecord/screens/add_data.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      Items(
          title: "رجسٹریشن فارم",
          icon: const Icon(
            Icons.add_circle_outline,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddData()),
            );
          }),
      Items(
        title: " پندرہ رکنی باڈی",
        icon: const Icon(Icons.group_outlined),
        onPressed: () {},
      ),
      Items(
        title: "ووٹر لسٹ",
        icon: const Icon(Icons.list_alt_outlined),
        onPressed: () {},
      ),
      Items(
        title: "ڈاکیومنٹ",
        icon: const Icon(Icons.document_scanner_outlined),
        onPressed: () {},
      ),
      Items(
          title: "میڈیا",
          icon: const Icon(Icons.perm_media_outlined),
          onPressed: () {}),
      Items(
          title: "ہم سے رابطہ کریں",
          icon: const Icon(Icons.contact_page_outlined),
          onPressed: () {}),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
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
                      onTap: data.onPressed,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
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
