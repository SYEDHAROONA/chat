import 'dart:io';

import 'package:chat/Service/Apiservice.dart';
import 'package:chat/screens/model/chatroommodel.dart';
import 'package:chat/screens/model/messagemodel.dart';
import 'package:chat/screens/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class bodyMessage extends StatefulWidget {
  Chatroommodel char;
  bodyMessage({super.key, required this.char});

  @override
  State<bodyMessage> createState() => _bodyMessageState();
}

class _bodyMessageState extends State<bodyMessage> {
  TextEditingController _textController = TextEditingController();
  ApiService service = ApiService();
  List<Messagemodel> message = [];
  late Usermodel user;
  late Chatroommodel chat;
  late IO.Socket _socket;

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    chat = widget.char;
    user = await service.getUsers();
    message = await service.getmessage(chat.chatRoomId);
    _socket = IO.io('172.10.1.60:3000 ',
        IO.OptionBuilder().setQuery({'chatRoomId': chat.chatRoomId}));
  }

  _sendmessage(Messagemodel message) {
    _socket.emit('message', messagemodelToJson(message));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: message.length,
            itemBuilder: (context, index) => Message(
              message: message[index],
              user: user,
              chat: chat,
            ),
          ),
        )),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.amber, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: 'Type message',
                  ),
                ),
              ),
              MaterialButton(
                shape: const CircleBorder(),
                onPressed: () {
                  setState(() {
                    if (_textController.text.isNotEmpty) {
                      Messagemodel input = Messagemodel(
                          senderId: user.userId,
                          receiverId: chat.chatRoomId,
                          messageType: 'text',
                          message: _textController.text,
                          url: '',
                          isRead: true,
                          chatRoomId: chat.chatRoomId);
                      _sendmessage(input);
                    }
                  });
                  _textController.clear();
                },
                child: const Icon(Icons.send),
              )
            ],
          ),
        )),
      ],
    );
  }
}

class Message extends StatelessWidget {
  Message(
      {super.key,
      required this.message,
      required this.user,
      required this.chat});
  Messagemodel message;
  Usermodel user;
  Chatroommodel chat;

  @override
  Widget build(BuildContext context) {
    // Widget messageContaint(ChatMessage message) {
    //   switch (message.messageType) {
    //     case ChatMessageType.text:
    //       return Textmessage(message: message);
    //     default:
    //       return SizedBox();
    //   }

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: user.userId == message.senderId
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (!(user.userId == message.senderId)) ...[
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(chat.chatRoomPicture),
                )
              ],
              const SizedBox(
                width: 5,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.amber
                        .withOpacity(user.userId == message.senderId ? 1 : 0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  message.message,
                  style: TextStyle(
                      color: user.userId == message.senderId
                          ? Colors.white
                          : Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
