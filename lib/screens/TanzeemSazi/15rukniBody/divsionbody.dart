import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:shimmer/shimmer.dart';

import 'package:voterrecord/models/dashboardItem.dart';
import 'package:voterrecord/utils/bodytile.dart';
import 'package:voterrecord/utils/container_menu.dart';
import 'package:voterrecord/utils/list_utils.dart';

import '/screens/TanzeemSazi/15rukniBody/tabledata.dart';

class DivsionBody extends StatefulWidget {
  const DivsionBody({super.key, this.arg});
  final Object? arg;

  @override
  State<DivsionBody> createState() => _DivsionBodyState();
}

List<dynamic> divisons = [];

class _DivsionBodyState extends State<DivsionBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("ڈویژن پندرہ رکنی باڈی"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 10.0, top: 10),
            child: Text(
              "ضلع منتخب کریں",
              style: TextStyle(fontFamily: 'NotoNastaliqUrdu', fontSize: 20),
            ),
          ),
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("District")
                      .doc(widget.arg.toString())
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!["ضلع"].length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {},
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
                                          snapshot.data!["ضلع"][index],
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
                      itemBuilder: (BuildContext ctxt, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 120,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Card(
                                  color: Colors.transparent,
                                 
                                )),
                          );}
                        ),
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