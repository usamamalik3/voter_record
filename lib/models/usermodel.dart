// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? email;
  String? province;
  String? zone;
  String? divsion;
  String? district;
  String? password;
  String? role;
  UserModel({
    this.email,
    this.province,
    this.zone,
    this.divsion,
    this.district,
    this.password,
    this.role,
  });

  UserModel copyWith({
    String? email,
    String? province,
    String? zone,
    String? divsion,
    String? district,
    String? password,
    String? role,
  }) {
    return UserModel(
      email: email ?? this.email,
      province: province ?? this.province,
      zone: zone ?? this.zone,
      divsion: divsion ?? this.divsion,
      district: district ?? this.district,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'province': province,
      'zone': zone,
      'divsion': divsion,
      'district': district,
      'password': password,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] != null ? map['email'] as String : null,
      province: map['province'] != null ? map['province'] as String : null,
      zone: map['zone'] != null ? map['zone'] as String : null,
      divsion: map['divsion'] != null ? map['divsion'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(email: $email, province: $province, zone: $zone, divsion: $divsion, district: $district, password: $password, role: $role)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.province == province &&
      other.zone == zone &&
      other.divsion == divsion &&
      other.district == district &&
      other.password == password &&
      other.role == role;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      province.hashCode ^
      zone.hashCode ^
      divsion.hashCode ^
      district.hashCode ^
      password.hashCode ^
      role.hashCode;
  }
}
