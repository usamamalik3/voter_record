import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voterrecord/utils/bodytile.dart';

class ZoneBody extends StatefulWidget {
  const ZoneBody({super.key});
  @override
  @override
  State<ZoneBody> createState() => _ZoneBodyState();
}

List<dynamic> divisons = [];

class _ZoneBodyState extends State<ZoneBody> {
  @override
  void initState() {
    // TODO: implement initState
    FirebaseFirestore.instance
        .collection("Divsion")
        .doc('پنجاب')
        .get()
        .then((value) {
      setState(() {
        divisons = value.data()!["ڈویژن"];
      });
    });
    super.initState();
  }

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
         const  Padding(
            padding:  EdgeInsets.only(right:10.0),
            child: Text("ڈویژن باڈی",
             style:
                          TextStyle(fontFamily: 'NotoNastaliqUrdu', fontSize: 20),),
          ),
        
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: divisons.length,
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
                  image:  NetworkImage("https://bit.ly/3fNlcdz"),
                  fit:BoxFit.cover
                ),
                            borderRadius: BorderRadius.circular(12),
                            
                          ),
                          child:Card(
                            color: Colors.transparent,
                            child:  Center(
                              child: Text(
                                  divisons[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                            ),
                          )
                          
                        ),
                      ),
                    );
                  }),
                            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
          
                itemCount: 6,
                itemBuilder: (BuildContext ctxt, int index) {
                  return BodyTile(address: 'وحدت روڈ، بلاک سی کالج بلاک علامہ اقبال ٹاؤن، لاہور', designation: 'امیر', name: 'احمد',);
                }),
          )

       
        ],
      ),
    );
  }
}
