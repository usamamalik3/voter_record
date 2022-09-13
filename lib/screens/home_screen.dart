import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:voterrecord/models/database_service.dart';
import 'package:voterrecord/screens/add_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    TextEditingController cnicController = TextEditingController();
  bool isLoading =false;
String searchKey = '';
Stream? streamQuery;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0Xff008000),
        title: const Center(child: Text("Search")),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width*0.95,
                child: TextFormField(
                   onChanged: (value){
                    if(value != ""){

                    
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



}
Widget _buildListItem(DocumentSnapshot document) {
  return  ListTile(
    title: Text(document['name']),
    subtitle: Text(document['fathername']),
  );
}
