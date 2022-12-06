import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:voterrecord/models/partyformModel.dart';
import 'package:voterrecord/models/voter.dart';
import 'package:voterrecord/screens/voter/voterdetail.dart';

import 'package:voterrecord/utils/search_filtters.dart';
import 'package:voterrecord/utils/textfield_mask.dart';



class MemberSearch extends StatefulWidget {
  const MemberSearch({Key? key}) : super(key: key);

  @override
  State<MemberSearch> createState() => _MemberSearchState();
}

class _MemberSearchState extends State<MemberSearch> {
  TextEditingController cnicController = TextEditingController();
  bool isLoading = false;
  String searchKey = '';
  Filters selectedFliter = Filters.byCNIC;

  final maskFormatter = MaskTextInputFormatter(
      mask: '#####-#######-#',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0Xff008000),
        title: const Center(child: Text("ووٹر تلاش کری")),
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
              
              keyboardType: TextInputType.text,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              controller: cnicController,
              inputFormatters: [getTextFieldMask(Filters.byCNIC)],
              validator: RequiredValidator(errorText: "Required"),
              decoration: InputDecoration(
                
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 100,
                    child: DropdownButton(
                      isExpanded: true,
                      items: Filters.values.map(
                        (val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(getFliterName(val)),
                          );
                        },
                      ).toList(),
                      value: selectedFliter,
                      onChanged: (Filters? value) {
                        setState(() {
                          selectedFliter = value!;
                        });
                      },
                    ),
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: "${getFliterName(selectedFliter)} درج کریں ",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: searchKey != ''
                      ? FirebaseFirestore.instance
                          .collection('PartyMember')
                          .where(getFliterVariable(selectedFliter),
                              isGreaterThanOrEqualTo: searchKey)
                          .where(getFliterVariable(selectedFliter),
                              isLessThan: '${searchKey}z')
                          .snapshots()
                      : null,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      List<PartyMemberform> members = snapshot.data!.docs
                          .map((docSnapshot) =>
                              PartyMemberform.fromDocumentSnapshot(docSnapshot))
                          .toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: members.length,
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap: (){ 
                               },
                              child: _buildListItem(members[index])),
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

  Widget _buildListItem(PartyMemberform member) {
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
                    "${member.name!} - ${member.fathername!}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(member.cnic!)
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
