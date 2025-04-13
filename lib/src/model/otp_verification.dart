import 'dart:convert';

class OtpVerification {
  String otp;

  OtpVerification({
    required this.otp,
  });

  factory OtpVerification.fromRawJson(String str) => OtpVerification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpVerification.fromJson(Map<String, dynamic> json) => OtpVerification(
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
  };
}