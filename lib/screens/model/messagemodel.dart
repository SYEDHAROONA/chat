// To parse this JSON data, do
//
//     final messagemodel = messagemodelFromJson(jsonString);

import 'dart:convert';

List<Messagemodel> messagemodelFromJson(String str) => List<Messagemodel>.from(
    json.decode(str).map((x) => Messagemodel.fromJson(x)));

String messagesmodelToJson(List<Messagemodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
    
String messagemodelToJson(Messagemodel data) => json.encode(data.toJson());

class Messagemodel {
  Messagemodel({
    required this.senderId,
    required this.receiverId,
    required this.messageType,
    required this.message,
    required this.url,
    required this.isRead,
    required this.chatRoomId,
  });
  String senderId;
  String receiverId;
  String messageType;
  String message;
  String url;
  bool isRead;
  String chatRoomId;

  factory Messagemodel.fromJson(Map<String, dynamic> json) => Messagemodel(
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        messageType: json["message_type"],
        message: json["message"],
        url: json["url"],
        isRead: json["is_read"],
        chatRoomId: json["chat_room_id"],
      );

  Map<String, dynamic> toJson() => {
        "sender_id": senderId,
        "receiver_id": receiverId,
        "message_type": messageType,
        "message": message,
        "url": url,
        "is_read": isRead,
        "chat_room_id": chatRoomId,
      };
}
