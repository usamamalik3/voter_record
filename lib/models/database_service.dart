
import 'package:firebase_auth/firebase_auth.dart';
import 'package:voterrecord/models/partyformModel.dart';
import 'package:voterrecord/models/usermodel.dart';
import 'package:voterrecord/models/voter.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
   User? user = FirebaseAuth.instance.currentUser;

 addVoter(Voter voterData) async {
    await _db.collection("Voters").add(voterData.toMap());
  }
adduser(UserModel userdata) async{
  await _db.collection("user").doc(user!.uid).set(userdata.toMap());
}
updateuser(UserModel userdata, String documentid) async{
  await _db.collection("user").doc(documentid).update(userdata.toMap());
}
 

    updateVoter(Voter VoterData) async {
    await _db.collection("Voters").doc(VoterData.cnic.toString()).update(VoterData.toMap());
  }

  Future<void> deleteVoter(String documentId) async {
    await _db.collection("Voters").doc(documentId).delete();

  }
 
Future<List<Voter>> retrieveVoter() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Voters").get();
        print(snapshot);
return snapshot.docs
        .map((docSnapshot) => Voter.fromMap(docSnapshot.data()))
        .toList();
       
        
     
       
  }
   addmember(PartyMemberform Data) async {
    await _db.collection("PartyMember").add(Data.toMap());
  }



      
   
  }


 
