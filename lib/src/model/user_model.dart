import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String email;
  String uid;
  String? profilePic;
  String phoneNumber;
  UserModel({
    required this.name,
    required this.email,
    required this.uid,
    this.profilePic,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'uid': uid,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      uid: map['uid'] as String,
      profilePic:
          map['profilePic'] != null ? map['profilePic'] as String : null,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? name,
    String? email,
    String? uid,
    String? profilePic,
    String? phoneNumber,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      profilePic: profilePic ?? this.profilePic,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
