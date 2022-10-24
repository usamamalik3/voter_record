import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OfficeDetails extends StatelessWidget {
  const OfficeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Office')
                      .where('Category', isEqualTo: 'main')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                   shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data!.docs[index];
                              return OffileListTile(width: width, image: ds['image'], name: ds['Name'], contactno: ds['Contactno'], address: ds['Address'], location: ds['Location']);
                            })
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
                Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Office')
                      .where('Category', isEqualTo: 'main')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                   shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data!.docs[index];
                              return OffileListTile(width: width, image: ds['image'], name: ds['Name'], contactno: ds['Contactno'], address: ds['Address'], location: ds['Location']);
                            })
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
                Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Office')
                      .where('Category', isEqualTo: 'main')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                   shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data!.docs[index];
                              return OffileListTile(width: width, image: ds['image'], name: ds['Name'], contactno: ds['Contactno'], address: ds['Address'], location: ds['Location']);
                            })
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OffileListTile extends StatelessWidget {
  const OffileListTile({
    Key? key,
    required this.width,
    required this.image,
    required this.name,
    required this.contactno,
    required this.address,
    required this.location,
  }) : super(key: key);

  final double width;
  final String image;
  final String name;
  final String contactno;
  final String address;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 25, left: 20, top: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.grey)],
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 20)
                          ]),
                      child: Image.network(image, width: width * 0.3),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        location,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      contactno,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      address,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
