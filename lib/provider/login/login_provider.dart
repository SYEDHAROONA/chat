import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  bool isLoading = false;

  Future login() async {
    isLoading = true;
    notifyListeners();

    var url = Uri.parse('http:///192.168.42.161/:3000/api/auth');
    var response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 201) {
      var json = jsonDecode(response.body);
      String accessToken = json['accessToken'];
      String refreshToken = json['refreshToken'];

      const storage = FlutterSecureStorage();

      await storage.write(key: 'accessToken', value: accessToken);
      await storage.write(key: 'refreshToken', value: refreshToken);

      isLoading = false;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
