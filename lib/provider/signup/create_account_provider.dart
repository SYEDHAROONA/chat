import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CreateAccountProvider extends ChangeNotifier {
  String username = '';
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  File? file;

  Future<bool> createAccount() async {
    var url = Uri.parse('http://{ip}/api/users/upload');
    http.MultipartRequest request = http.MultipartRequest('POST', url);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', file!.path);
    request.files.add(multipartFile);
    request.fields['username'] = username;
    request.fields['firstname'] = firstname;
    request.fields['lastname'] = lastname;
    request.fields['email'] = email;
    request.fields['password'] = password;
    var response = await request.send();
    if (response.statusCode == 201) {
      username = '';
      firstname = '';
      lastname = '';
      email = '';
      password = '';
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
