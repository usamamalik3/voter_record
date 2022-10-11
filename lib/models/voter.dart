// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Voter {
   String? name;
  String? fathername;
  String? cnic;
  int? serialno;
  int? householdno;
  String? gender;
  int? age;
  String? address;
  String? polingstion;
  String? phonrno;
 String? stcode;
 String? choicechip;
  Voter({
    this.name,
    this.fathername,
    this.cnic,
    this.serialno,
    this.householdno,
    this.gender,
    this.age,
    this.address,
    this.polingstion,
    this.phonrno,
    this.stcode,
    this.choicechip,
  });

  Voter copyWith({
    String? name,
    String? fathername,
    String? cnic,
    int? serialno,
    int? householdno,
    String? gender,
    int? age,
    String? address,
    String? polingstion,
    String? phonrno,
    String? stcode,
    String? choicechip,
  }) {
    return Voter(
      name: name ?? this.name,
      fathername: fathername ?? this.fathername,
      cnic: cnic ?? this.cnic,
      serialno: serialno ?? this.serialno,
      householdno: householdno ?? this.householdno,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      address: address ?? this.address,
      polingstion: polingstion ?? this.polingstion,
      phonrno: phonrno ?? this.phonrno,
      stcode: stcode ?? this.stcode,
      choicechip: choicechip ?? this.choicechip
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'fathername': fathername,
      'cnic': cnic,
      'serialno': serialno,
      'householdno': householdno,
      'gender': gender,
      'age': age,
      'address': address,
      'polingstion': polingstion,
      'phonrno': phonrno,
      'stcode': stcode,
      'choicechip': choicechip,
    };
  }

  factory Voter.fromMap(Map<String, dynamic> map) {
    return Voter(
      name: map['name'] != null ? map['name'] as String : null,
      fathername: map['fathername'] != null ? map['fathername'] as String : null,
      cnic: map['cnic'] != null ? map['cnic'] as String : null,
      serialno: map['serialno'] != null ? map['serialno'] as int : null,
      householdno: map['householdno'] != null ? map['householdno'] as int : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      address: map['address'] != null ? map['address'] as String : null,
      polingstion: map['polingstion'] != null ? map['polingstion'] as String : null,
      phonrno: map['phonrno'] != null ? map['phonrno'] as String : null,
      stcode: map['stcode'] != null ? map['stcode'] as String : null,
      choicechip: map['choicechip'] != null ? map['choicechip'] as String : null,
    );
  }
  factory Voter.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Voter(
      name: doc['name'] != null ? doc['name'] as String : null,
      fathername:
          doc['fathername'] != null ? doc['fathername'] as String : null,
      cnic: doc['cnic'] != null ? doc['cnic'] as String : null,
      serialno: doc['serialno'] != null ? doc['serialno'] as int : null,
      householdno:
          doc['householdno'] != null ? doc['householdno'] as int : null,
      gender: doc['gender'] != null ? doc['gender'] as String : null,
      age: doc['age'] != null ? doc['age'] as int : null,
      address: doc['address'] != null ? doc['address'] as String : null,
      polingstion:
          doc['polingstion'] != null ? doc['polingstion'] as String : null,
      phonrno:
                doc['phonrno'] != null ? doc['phonrno'] as String : null,
      stcode:
                doc['stcode'] != null ? doc['stcode'] as String : null,
      choicechip:
                doc['choicechip'] != null ? doc['choicechip'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Voter.fromJson(String source) => Voter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Voter(name: $name, fathername: $fathername, cnic: $cnic, serialno: $serialno, householdno: $householdno, gender: $gender, age: $age, address: $address, polingstion: $polingstion, phonrno: $phonrno, stcode: $stcode, choicechip: $choicechip)';
  }

  @override
  bool operator ==(covariant Voter other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.fathername == fathername &&
      other.cnic == cnic &&
      other.serialno == serialno &&
      other.householdno == householdno &&
      other.gender == gender &&
      other.age == age &&
      other.address == address &&
      other.polingstion == polingstion &&
      other.phonrno == phonrno &&
      other.stcode == stcode &&
      other.choicechip== choicechip;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      fathername.hashCode ^
      cnic.hashCode ^
      serialno.hashCode ^
      householdno.hashCode ^
      gender.hashCode ^
      age.hashCode ^
      address.hashCode ^
      polingstion.hashCode ^
      phonrno.hashCode ^
      choicechip.hashCode ^
      stcode.hashCode;
  }
}
// Voter({
//     this.name,
//     this.fathername,
//     this.cnic,
//     this.serialno,
//     this.householdno,
//     this.gender,
//     this.age,
//     this.address,
//     this.polingstion,
//     this.phonrno,
//   });


//   Voter copyWith({
//     String? name,
//     String? fathername,
//     String? cnic,
//     int? serialno,
//     int? householdno,
//     String? gender,
//     int? age,
//     String? address,
//     String? polingstion,
//     String? phonrno,
//   }) {
//     return Voter(
//       name: name ?? this.name,
//       fathername: fathername ?? this.fathername,
//       cnic: cnic ?? this.cnic,
//       serialno: serialno ?? this.serialno,
//       householdno: householdno ?? this.householdno,
//       gender: gender ?? this.gender,
//       age: age ?? this.age,
//       address: address ?? this.address,
//       polingstion: polingstion ?? this.polingstion,
//       phonrno: phonrno ?? this.phonrno,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'fathername': fathername,
//       'cnic': cnic,
//       'serialno': serialno,
//       'householdno': householdno,
//       'gender': gender,
//       'age': age,
//       'address': address,
//       'polingstion': polingstion,
//       'phonrno': phonrno,
//     };
//   }

//   factory Voter.fromMap(Map<String, dynamic> map) {
//     return Voter(
//       name: map['name'] != null ? map['name'] as String : null,
//       fathername: map['fathername'] != null ? map['fathername'] as String : null,
//       cnic: map['cnic'] != null ? map['cnic'] as String : null,
//       serialno: map['serialno'] != null ? map['serialno'] as int : null,
//       householdno: map['householdno'] != null ? map['householdno'] as int : null,
//       gender: map['gender'] != null ? map['gender'] as String : null,
//       age: map['age'] != null ? map['age'] as int : null,
//       address: map['address'] != null ? map['address'] as String : null,
//       polingstion: map['polingstion'] != null ? map['polingstion'] as String : null,
//       phonrno: map['phonrno'] != null ? map['phonrno'] as String : null,
//     );
//   }
//   factory Voter.fromDocumentSnapshot(DocumentSnapshot doc) {
//     return Voter(
//       name: doc['name'] != null ? doc['name'] as String : null,
//       fathername:
//           doc['fathername'] != null ? doc['fathername'] as String : null,
//       cnic: doc['cnic'] != null ? doc['cnic'] as String : null,
//       serialno: doc['serialno'] != null ? doc['serialno'] as int : null,
//       householdno:
//           doc['householdno'] != null ? doc['householdno'] as int : null,
//       gender: doc['gender'] != null ? doc['gender'] as String : null,
//       age: doc['age'] != null ? doc['age'] as int : null,
//       address: doc['address'] != null ? doc['address'] as String : null,
//       polingstion:
//           doc['polingstion'] != null ? doc['polingstion'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Voter.fromJson(String source) => Voter.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Voter(name: $name, fathername: $fathername, cnic: $cnic, serialno: $serialno, householdno: $householdno, gender: $gender, age: $age, address: $address, polingstion: $polingstion, phonrno: $phonrno)';
//   }

//   @override
//   bool operator ==(covariant Voter other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.name == name &&
//       other.fathername == fathername &&
//       other.cnic == cnic &&
//       other.serialno == serialno &&
//       other.householdno == householdno &&
//       other.gender == gender &&
//       other.age == age &&
//       other.address == address &&
//       other.polingstion == polingstion &&
//       other.phonrno == phonrno;
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^
//       fathername.hashCode ^
//       cnic.hashCode ^
//       serialno.hashCode ^
//       householdno.hashCode ^
//       gender.hashCode ^
//       age.hashCode ^
//       address.hashCode ^
//       polingstion.hashCode ^
//       phonrno.hashCode;
//   }
// }

