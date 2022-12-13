import 'package:chat/screens/home/chat/chatcard.dart';
import 'package:chat/screens/home/chat/message/messageScreen.dart';
import 'package:chat/screens/model/chatroommodel.dart';
import 'package:chat/screens/model/usermodel.dart';
import 'package:flutter/material.dart';

class Chatroom extends StatefulWidget {
  List<Chatroommodel> chat;
  Usermodel user;
  Chatroom({super.key, required this.chat, required this.user});

  @override
  State<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  late List<Chatroommodel> chatroom;
  late Usermodel user;

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    chatroom = widget.chat;
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: chatroom.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: Container(
                      margin: const EdgeInsets.only(top: 0, left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: const Text(
                              'Messages',
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 25),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 0,
                            ),
                            margin: const EdgeInsets.only(left: 150, top: 0),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                            color: Colors.white,
                          ),
                        ],
                      ))),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: chatroom.length,

                              ///user message screen
                              itemBuilder: (context, index) => Chatcard(
                                    chat: chatroom[index],
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  messageScreen(
                                                    chat: chatroom[index],
                                                  )));
                                    },
                                  )))
                    ],
                  )),
            ]),
    );
  }
}
