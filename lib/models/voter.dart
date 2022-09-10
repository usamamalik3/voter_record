// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Voter {
  String? name;
String? fathername;
int? cnic;
int? serialno;
int? householdno;
String? gender;
int? age;
String? address;
String? polingstion;
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
  });

  Voter copyWith({
    String? name,
    String? fathername,
    int? cnic,
    int? serialno,
    int? householdno,
    String? gender,
    int? age,
    String? address,
    String? polingstion,
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
    };
  }

  factory Voter.fromMap(Map<String, dynamic> map) {
    return Voter(
      name: map['name'] != null ? map['name'] as String : null,
      fathername: map['fathername'] != null ? map['fathername'] as String : null,
      cnic: map['cnic'] != null ? map['cnic'] as int : null,
      serialno: map['serialno'] != null ? map['serialno'] as int : null,
      householdno: map['householdno'] != null ? map['householdno'] as int : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      address: map['address'] != null ? map['address'] as String : null,
      polingstion: map['polingstion'] != null ? map['polingstion'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Voter.fromJson(String source) => Voter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Voter(name: $name, fathername: $fathername, cnic: $cnic, serialno: $serialno, householdno: $householdno, gender: $gender, age: $age, address: $address, polingstion: $polingstion)';
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
      other.polingstion == polingstion;
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
      polingstion.hashCode;
  }
}
