// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PartyMemberform {
   String? farmno;
   String? name;
  String? fathername;
  String? cnic;
  String? dob;
  int? age;
  String? edu;
  String? institute;
  String? bloodgroup;
  String? profession;
  String? mobile;
  String? whatsapp;
  String? province;
  String? zone;
  String? divison;
  String? district;
  String? tehsil;
  String? na;
  String? pp;
  String? uc;
  String? gender;
  String? ward;
  String? address;
  PartyMemberform({
    this.farmno,
    this.name,
    this.fathername,
    this.cnic,
    this.dob,
    this.age,
    this.edu,
    this.institute,
    this.bloodgroup,
    this.profession,
    this.mobile,
    this.whatsapp,
    this.province,
    this.zone,
    this.divison,
    this.district,
    this.tehsil,
    this.na,
    this.pp,
    this.uc,
    this.gender,
    this.ward,
    this.address,
  });

  PartyMemberform copyWith({
    String? farmno,
    String? name,
    String? fathername,
    String? cnic,
    String? dob,
    int? age,
    String? edu,
    String? institute,
    String? bloodgroup,
    String? profession,
    String? mobile,
    String? whatsapp,
    String? province,
    String? zone,
    String? divison,
    String? district,
    String? tehsil,
    String? na,
    String? pp,
    String? uc,
    String? gender,
    String? ward,
    String? address,
  }) {
    return PartyMemberform(
      farmno: farmno ?? this.farmno,
      name: name ?? this.name,
      fathername: fathername ?? this.fathername,
      cnic: cnic ?? this.cnic,
      dob: dob ?? this.dob,
      age: age ?? this.age,
      edu: edu ?? this.edu,
      institute: institute ?? this.institute,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      profession: profession ?? this.profession,
      mobile: mobile ?? this.mobile,
      whatsapp: whatsapp ?? this.whatsapp,
      province: province ?? this.province,
      zone: zone ?? this.zone,
      divison: divison ?? this.divison,
      district: district ?? this.district,
      tehsil: tehsil ?? this.tehsil,
      na: na ?? this.na,
      pp: pp ?? this.pp,
      uc: uc ?? this.uc,
      gender: gender ?? this.gender,
      ward: ward ?? this.ward,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'farmno': farmno,
      'name': name,
      'fathername': fathername,
      'cnic': cnic,
      'dob': dob,
      'age': age,
      'edu': edu,
      'institute': institute,
      'bloodgroup': bloodgroup,
      'profession': profession,
      'mobile': mobile,
      'whatsapp': whatsapp,
      'province': province,
      'zone': zone,
      'divison': divison,
      'district': district,
      'tehsil': tehsil,
      'na': na,
      'pp': pp,
      'uc': uc,
      'gender': gender,
      'ward': ward,
      'address': address,
    };
  }

  factory PartyMemberform.fromMap(Map<String, dynamic> map) {
    return PartyMemberform(
      farmno: map['farmno'] != null ? map['farmno'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      fathername: map['fathername'] != null ? map['fathername'] as String : null,
      cnic: map['cnic'] != null ? map['cnic'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      edu: map['edu'] != null ? map['edu'] as String : null,
      institute: map['institute'] != null ? map['institute'] as String : null,
      bloodgroup: map['bloodgroup'] != null ? map['bloodgroup'] as String : null,
      profession: map['profession'] != null ? map['profession'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      whatsapp: map['whatsapp'] != null ? map['whatsapp'] as String : null,
      province: map['province'] != null ? map['province'] as String : null,
      zone: map['zone'] != null ? map['zone'] as String : null,
      divison: map['divison'] != null ? map['divison'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      tehsil: map['tehsil'] != null ? map['tehsil'] as String : null,
      na: map['na'] != null ? map['na'] as String : null,
      pp: map['pp'] != null ? map['pp'] as String : null,
      uc: map['uc'] != null ? map['uc'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      ward: map['ward'] != null ? map['ward'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PartyMemberform.fromJson(String source) => PartyMemberform.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PartyMemberform(farmno: $farmno, name: $name, fathername: $fathername, cnic: $cnic, dob: $dob, age: $age, edu: $edu, institute: $institute, bloodgroup: $bloodgroup, profession: $profession, mobile: $mobile, whatsapp: $whatsapp, province: $province, zone: $zone, divison: $divison, district: $district, tehsil: $tehsil, na: $na, pp: $pp, uc: $uc, gender: $gender, ward: $ward, address: $address)';
  }

  @override
  bool operator ==(covariant PartyMemberform other) {
    if (identical(this, other)) return true;
  
    return 
      other.farmno == farmno &&
      other.name == name &&
      other.fathername == fathername &&
      other.cnic == cnic &&
      other.dob == dob &&
      other.age == age &&
      other.edu == edu &&
      other.institute == institute &&
      other.bloodgroup == bloodgroup &&
      other.profession == profession &&
      other.mobile == mobile &&
      other.whatsapp == whatsapp &&
      other.province == province &&
      other.zone == zone &&
      other.divison == divison &&
      other.district == district &&
      other.tehsil == tehsil &&
      other.na == na &&
      other.pp == pp &&
      other.uc == uc &&
      other.gender == gender &&
      other.ward == ward &&
      other.address == address;
  }

  @override
  int get hashCode {
    return farmno.hashCode ^
      name.hashCode ^
      fathername.hashCode ^
      cnic.hashCode ^
      dob.hashCode ^
      age.hashCode ^
      edu.hashCode ^
      institute.hashCode ^
      bloodgroup.hashCode ^
      profession.hashCode ^
      mobile.hashCode ^
      whatsapp.hashCode ^
      province.hashCode ^
      zone.hashCode ^
      divison.hashCode ^
      district.hashCode ^
      tehsil.hashCode ^
      na.hashCode ^
      pp.hashCode ^
      uc.hashCode ^
      gender.hashCode ^
      ward.hashCode ^
      address.hashCode;
  }
}
