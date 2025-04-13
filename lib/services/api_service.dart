import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_ease/src/model/Login.dart';
import 'package:travel_ease/src/model/otp_verification.dart';
import 'package:travel_ease/src/model/register.dart';

import '../core/app_const.dart';

class ApiService {
  // Singleton instance
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  static const String _baseUrl = baseURL;

  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Map<String, dynamic> _handleResponse(http.Response response) {
    try {
      final responseBody = response.body;

      if (responseBody.startsWith('<triptrackresp>') &&
          responseBody.endsWith('</triptrackresp>')) {
        final content = responseBody.substring(15, responseBody.length - 16);
        final jsonResponse = jsonDecode(content);

        if (response.statusCode == 200) {
          return {"success": true, "data": jsonResponse};
        } else {
          return {
            "success": false,
            "error": jsonResponse["message"] ?? "Something went wrong!"
          };
        }
      } else {
        return {
          "success": false,
          "error": "Invalid response format. Expected <triptrackresp> tags."
        };
      }
    } catch (e) {
      return {"success": false, "error": "Error parsing response: $e"};
    }
  }

  // Register User
  Future<Map<String, dynamic>> registerUser(Register registerData) async {
    const url = '$_baseUrl/company.php';

    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: _headers,
            body: registerData.toRawJson(),
          )
          .timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } catch (e) {
      return {"success": false, "error": "Network error: $e"};
    }
  }

  // Login User
  Future<Map<String, dynamic>> loginUser(Login loginData) async {
    const url = '$_baseUrl/login.php';

    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: _headers,
            body: loginData.toRawJson(),
          )
          .timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } catch (e) {
      return {"success": false, "error": "Network error: $e"};
    }
  }

  // Verify OTP
  Future<Map<String, dynamic>> verifyOTP(
      OtpVerification otpVerification) async {
    const url = '$_baseUrl/otpverification.php';

    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: _headers,
            body: otpVerification.toRawJson(),
          )
          .timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } catch (e) {
      return {"success": false, "error": "Network error: $e"};
    }
  }
}
