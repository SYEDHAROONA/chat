import 'dart:developer';

import 'package:chat/Service/constant.dart';
import 'package:chat/screens/model/chatroommodel.dart';
import 'package:chat/screens/model/messagemodel.dart';
import 'package:chat/screens/model/usermodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Usermodel> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.userapi);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Usermodel _model = usermodelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    throw '';
  }

  Future<List<Messagemodel>> getmessage(String id) async {
    try {
      var url = Uri.parse(ApiConstants.messageapi);
      var response = await http.post(url, body: {'id': id});
      if (response.statusCode == 200) {
        List<Messagemodel> messageModel = messagemodelFromJson(response.body);
        return messageModel;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<Chatroommodel>> getchatroom() async {
    try {
      var url = Uri.parse(ApiConstants.chatapi);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Chatroommodel> chatmodel = chatroommodelFromJson(response.body);
        return chatmodel;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
