// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Voter {
String? name;
  Voter({
    this.name,
  });


  Voter copyWith({
    String? name,
  }) {
    return Voter(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Voter.fromMap(Map<String, dynamic> map) {
    return Voter(
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Voter.fromJson(String source) => Voter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Voter(name: $name)';

  @override
  bool operator ==(covariant Voter other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
