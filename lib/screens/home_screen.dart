import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:voterrecord/models/database_service.dart';
import 'package:voterrecord/models/voter.dart';
import 'package:voterrecord/screens/add_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
<<<<<<< HEAD
    TextEditingController cnicController = TextEditingController();
  bool isLoading =false;
String searchKey = '';
Stream? streamQuery;
=======
  TextEditingController cnicController = TextEditingController();
  bool isLoading = false;
  String searchKey = '';
  Stream? streamQuery;
  final maskFormatter = MaskTextInputFormatter(
      mask: '#####-#######-#',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
>>>>>>> 10a42304cf8e13ce14b2f66cc7b5c8752c036661

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0Xff008000),
        title: const Center(child: Text("Search")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 20),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: width * 0.95,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchKey = value;
                   
                  });}
    },
                    
                      keyboardType: TextInputType.number,
                      controller: cnicController,
                      validator: RequiredValidator(errorText: "Required"),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        label: Text("تلاش کریں", style: TextStyle(fontFamily: "NotoNastaliqUrdu"),),
                        border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintText: "شناختی کارڈ درج کریں",
                      
                        
                      ),
                    ),

              ),
        searchKey != ""?
        StreamBuilder(
          
    stream: FirebaseFirestore.instance
    .collection('Voters')
    .where('cnic',isEqualTo: searchKey)
    .snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
       if (streamSnapshort.connectionState == ConnectionState.active){
          return ListView.builder(
        shrinkWrap: true,
        itemCount: streamSnapshort.data!.docs.length,
        itemBuilder: (context, index) =>
            _buildListItem(streamSnapshort.data!.docs[index]),
      );
       }
       else {
         return  const Center(
              child: CupertinoActivityIndicator()
          );
       }
   } ):
    Container(),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0Xff008000),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddData()),
        ),
        tooltip: 'Add data',
        child: const Icon(Icons.add),
      ),
    );
  }

<<<<<<< HEAD


}
Widget _buildListItem(DocumentSnapshot document) {
  return  ListTile(
    title: Text(document['name']),
    subtitle: Text(document['fathername']),
  );
=======
  Widget _buildListItem(Voter voter) {
    return Card(
        color: Colors.white.withOpacity(.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${voter.name!} - ${voter.fathername!}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(voter.cnic!)
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 30,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
>>>>>>> 10a42304cf8e13ce14b2f66cc7b5c8752c036661
}
