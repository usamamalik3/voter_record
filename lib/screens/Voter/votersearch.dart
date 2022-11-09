import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:voterrecord/models/voter.dart';
import 'package:voterrecord/screens/PartyForm/partyfrom.dart';

import 'package:voterrecord/screens/Voter/voterdetail.dart';
import 'package:voterrecord/utils/search_filtters.dart';


class VoterSearch extends StatefulWidget {
  const VoterSearch({Key? key}) : super(key: key);

  @override
  State<VoterSearch> createState() => _VoterSearchState();
}

class _VoterSearchState extends State<VoterSearch> {
  TextEditingController cnicController = TextEditingController();
  bool isLoading = false;
  String searchKey = '';
  Filters selectedFliter = Filters.byCNIC;

  

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0Xff008000),
        title: const Center(child: Text("ووٹر تلاش کریں")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 20),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  searchKey = value;
                });
              },
              
              keyboardType: TextInputType.number,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              controller: cnicController,
              inputFormatters: [maskFormatter],
              validator: RequiredValidator(errorText: "Required"),
              decoration: const InputDecoration(
                
               
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: "قومی شناختی کارڈ درج کریں ",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: searchKey != ''
                      ? FirebaseFirestore.instance
                          .collection('Voters')
                          .where('cnic', isGreaterThanOrEqualTo: searchKey)
                          .where('cnic',
                              isLessThan: '${searchKey}z')
                          .snapshots()
                      : null,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      List<Voter> voters = snapshot.data!.docs
                          .map((docSnapshot) =>
                              Voter.fromDocumentSnapshot(docSnapshot))
                          .toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: voters.length,
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap: (){ Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Voterdetail(voter: voters[index],)));},
                              child: _buildListItem(voters[index])),
                      );
                    }

                    return searchKey != ''
                        ? const Center(child: CupertinoActivityIndicator())
                        : Container();

                    // }
                    // else{
                  }),
            )
          ]),
        ),
      ),
     
    );
  }

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
}
