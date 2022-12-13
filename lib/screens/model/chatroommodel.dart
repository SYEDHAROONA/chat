// To parse this JSON data, do
//
//     final chatroommodel = chatroommodelFromJson(jsonString);

import 'dart:convert';

List<Chatroommodel> chatroommodelFromJson(String str) =>
    List<Chatroommodel>.from(
        json.decode(str).map((x) => Chatroommodel.fromJson(x)));

String chatroommodelToJson(List<Chatroommodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chatroommodel {
  Chatroommodel({
    required this.chatRoomId,
    required this.chatRoomName,
    required this.chatRoomType,
    required this.chatRoomPicture,
    required this.member,
    required this.lastmessage,
  });

  String chatRoomId;
  String chatRoomName;
  String chatRoomType;
  String chatRoomPicture;
  String member;
  String lastmessage;

  factory Chatroommodel.fromJson(Map<String, dynamic> json) => Chatroommodel(
        chatRoomId: json["chatRoomId"],
        chatRoomName: json["chatRoomName"],
        chatRoomType: json["chatRoomType"],
        chatRoomPicture: json["chatRoomPicture"],
        member: json["member"],
        lastmessage: json["lastmessage"],
      );

  Map<String, dynamic> toJson() => {
        "chatRoomId": chatRoomId,
        "chatRoomName": chatRoomName,
        "chatRoomType": chatRoomType,
        "chatRoomPicture": chatRoomPicture,
        "member": member,
        "lastmessage": lastmessage,
      };
}
