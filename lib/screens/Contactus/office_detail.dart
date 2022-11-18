
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OfficeDetails extends StatelessWidget {
  const OfficeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
           floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/addoffice');
        },
        child: const Icon(Icons.add),
      ),
          appBar: AppBar(
             title: const Center(child:  Text("دفاتر کی تفصیل", style: TextStyle(fontFamily: "NotoNastaliqUrdu"),))
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SegmentedTabControl(
                    // Customization of widget
                    radius: const Radius.circular(12),
                    backgroundColor: Colors.grey.shade300,
                  
                    tabTextColor: Colors.black45,
                    selectedTabTextColor: Colors.white,
                    squeezeIntensity: 2,
                    height: 45,
                    tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                    textStyle: Theme.of(context).textTheme.bodyText1,
                    // Options for selection
                    // All specified values will override the [SegmentedTabControl] setting
                    tabs:const  [
                      SegmentTab(
                        label: 'ضلع',
                        // For example, this overrides [indicatorColor] from [SegmentedTabControl]
                        color: Colors.green,
                      ),
                       SegmentTab(
                        label: 'ڈویژن',
                        // For example, this overrides [indicatorColor] from [SegmentedTabControl]
                        color: Colors.green,
                      ),
                      SegmentTab(
                        label: 'زون',
                        color: Colors.green,
                       
                      ),
                       SegmentTab(
                        label: 'مرکز',
                        color: Colors.green,),
                    ],
                  ),
                ),
                // Sample pages
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      StreamBuilder<QuerySnapshot>(
                         stream: FirebaseFirestore.instance
                             .collection('Office')
                             .where('Category', isEqualTo: 'District')
                             .snapshots(),
                         builder: (context, AsyncSnapshot snapshot) {
                           return snapshot.hasData
                               ? ListView.builder(
                                   physics: const BouncingScrollPhysics(),
                                   shrinkWrap: true,
                                   itemCount: snapshot.data!.docs.length,
                                   itemBuilder: (context, index) {
                                     DocumentSnapshot ds = snapshot.data!.docs[index];
                                     return OffileListTile(
                                         width: width,
                                         image: ds['image'],
                                         name: ds['Name'],
                                         contactno: ds['Contactno'],
                                         address: ds['Address'],
                                         );
                                   })
                               : const Center(
                                   child: CircularProgressIndicator(),
                                 );
                         },
                       ),
                       StreamBuilder<QuerySnapshot>(
                         stream: FirebaseFirestore.instance
                             .collection('Office')
                             .where('Category', isEqualTo: 'divsion')
                             .snapshots(),
                         builder: (context, AsyncSnapshot snapshot) {
                           return snapshot.hasData
                               ? ListView.builder(
                                   physics: const BouncingScrollPhysics(),
                                   shrinkWrap: true,
                                   itemCount: snapshot.data!.docs.length,
                                   itemBuilder: (context, index) {
                                     DocumentSnapshot ds = snapshot.data!.docs[index];
                                     return OffileListTile(
                                         width: width,
                                         image: ds['image'],
                                         name: ds['Name'],
                                         contactno: ds['Contactno'],
                                         address: ds['Address'],
                                         );
                                   })
                               : const Center(
                                   child: CircularProgressIndicator(),
                                 );
                         },
                       ),
               StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Office')
                      .where('Category', isEqualTo: 'zone')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data!.docs[index];
                              return OffileListTile(
                                  width: width,
                                  image: ds['image'],
                                  name: ds['Name'],
                                  contactno: ds['Contactno'],
                                  address: ds['Address'],
                                  );
                            })
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
          
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Office')
                      .where('Category', isEqualTo: 'main')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data!.docs[index];
                              return InkWell(
                                onTap: () {
                                 
                                },
                                child: OffileListTile(
                                    width: width,
                                    image: ds['image'],
                                    name: ds['Name'],
                                    contactno: ds['Contactno'],
                                    address: ds['Address'],
                                    ),
                              );
                            })
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
            

                    ],
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
  
  }) : super(key: key);

  final double width;
  final String image;
  final String name;
  final String contactno;
  final String address;
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.grey)],
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 20)
                          ]),
                      child: Image.network(image, width: width * 0.25),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8.0),
                  //   child: Text(
                  //     location,
                  //     style: const TextStyle(fontSize: 16),
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only( left: 10, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width*0.5,
                      child: Text(
                        
                        name,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: width*0.5,
                      child: Text(
                        contactno,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: width*0.5,
                      child: Text(
                        address,
                        maxLines: 3,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
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
