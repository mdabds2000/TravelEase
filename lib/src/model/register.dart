import 'dart:convert';

class Register {
  String? ownerName;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  String? companyAddress;
  String? status;
  String? password;

  Register({
    this.ownerName,
    this.companyName,
    this.companyEmail,
    this.companyPhone,
    this.companyAddress,
    this.status,
    this.password,
  });

  factory Register.fromRawJson(String str) => Register.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    ownerName: json["owner_name"],
    companyName: json["company_name"],
    companyEmail: json["company_email"],
    companyPhone: json["company_phone"],
    companyAddress: json["company_address"],
    status: json["status"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "owner_name": ownerName,
    "company_name": companyName,
    "company_email": companyEmail,
    "company_phone": companyPhone,
    "company_address": companyAddress,
    "status": status,
    "password": password,
  };
}
