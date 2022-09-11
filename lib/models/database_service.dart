
import 'package:voterrecord/models/voter.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

 addVoter(Voter VoterData) async {
    await _db.collection("Voters").add(VoterData.toMap());
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
      
   
  }


 
