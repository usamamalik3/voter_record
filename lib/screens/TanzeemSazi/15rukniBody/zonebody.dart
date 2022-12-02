import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:voterrecord/models/dashboardItem.dart';
import 'package:voterrecord/screens/tanzeemSazi/15rukniBody/tabledata.dart';
import 'package:voterrecord/utils/bodytile.dart';
import 'package:voterrecord/utils/container_menu.dart';
import 'package:voterrecord/utils/list_utils.dart';

class ZoneBody extends StatefulWidget {
  ZoneBody({super.key, this.arg});
  var arg;

  @override
  State<ZoneBody> createState() => _ZoneBodyState();
}

// List<dynamic> divisons = [];

class _ZoneBodyState extends State<ZoneBody> {
  // divsion(arg) async {
  //   await FirebaseFirestore.instance
  //       .collection("tazeemdivsion")
  //       .doc(arg)
  //       .get()
  //       .then((value) {
  //     setState(() {
  //       divisons = value.data()!["ڈویژن"];
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   divsion(widget.arg);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("زون پندرہ رکنی باڈی"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 10.0, top: 10),
            child: Text(
              "ڈویژن منتخب کریں",
              style: TextStyle(fontFamily: 'NotoNastaliqUrdu', fontSize: 20),
            ),
          ),
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("tazeemdivsion")
                      .doc(widget.arg)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!["ڈویژن"].length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  Navigator.pushNamed(context, '/divsionbody',
                                      arguments: snapshot.data!["ڈویژن"]
                                          [index]);
                                },
                                child: Container(
                                    width: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://bit.ly/3fNlcdz"),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Card(
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Text(
                                          snapshot.data!["ڈویژن"][index],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            );
                          });
                    } else {
                      return Shimmer.fromColors(
                           period: const Duration(minutes: 5),
                        baseColor: Theme.of(context).primaryColor,
                        highlightColor: Theme.of(context).highlightColor,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Card(
                                      
                                    )),
                              );
                            }),
                      );
                    }
                  }),
            ),
          ),
           ContainerMenu(
              childAspectRatio: 0.90,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              list: tanzeemSaziList,
              mainAxisSpacing: 16,
            ),
        ],
      ),
    );
  }
}
