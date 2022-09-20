	import 'package:flutter/material.dart';
import 'package:voterrecord/models/dashboardItem.dart';
import 'package:voterrecord/screens/add_data.dart';


class DashBoard extends StatefulWidget {

   DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
 

  @override
  Widget build(BuildContext context) {
     Items item1 = Items(
      title: "رجسٹریشن فارم",
     
      icon: const Icon(Icons.add_circle_outline), onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddData()),);
      });

  Items item2 =  Items(
    title: " پندرہ رکنی باڈی",
   
    icon: const Icon(Icons.group_outlined),
     onPressed: (){},
  );

  Items item3 =  Items(
    title: "ووٹر لسٹ",
   
    icon: const Icon(Icons.list_alt_outlined),
     onPressed: (){},

  );

  Items item4 =  Items(
    title: "ڈاکیومنٹ",
  
    icon: const Icon(Icons.document_scanner_outlined),
     onPressed: (){},
  );

  Items item5 = Items(
    title: "میڈیا",
  
   icon: const Icon(Icons.perm_media_outlined),
    onPressed: (){}
  );

  Items item6 = Items(
    title: "ہم سے رابطہ کریں",
   
    icon: const Icon(Icons.contact_page_outlined),
     onPressed: (){}
  );
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    return Scaffold(
      appBar: AppBar(
          
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: const Text("Dashboard"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 72, 163, 75),Color.fromARGB(255, 17, 121, 5)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.only(top:15.0),
        child: Column(
          children: [     
        Expanded(
          child: Container(
            padding:  const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: GridView.count(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              childAspectRatio: .90,
              children: myList.map((data){
                return GestureDetector(
                  onTap: data.onPressed,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:  <Widget>[
                          data.icon,
                          
                  const SizedBox(height: 14),
                  Text(
                    data.title,
                    style:  const TextStyle(
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