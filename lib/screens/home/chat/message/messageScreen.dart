import 'package:chat/screens/home/chat/message/bodyMessage.dart';
import 'package:chat/screens/model/chatroommodel.dart';
import 'package:flutter/material.dart';

class messageScreen extends StatelessWidget {
  final Chatroommodel chat;
  const messageScreen({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(children: [
          CircleAvatar(
            backgroundImage: NetworkImage(chat.chatRoomPicture),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(chat.chatRoomName, style: const TextStyle(fontSize: 16))
        ]),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.call))],
      ),
      body: bodyMessage(
        char: chat,
      ),
    );
  }
}
