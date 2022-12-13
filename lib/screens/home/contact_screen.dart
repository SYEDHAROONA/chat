
import 'package:chat/Service/Apiservice.dart';
import 'package:chat/screens/model/chatroommodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Chatroommodel> chat = ApiService().getchatroom as List<Chatroommodel>;
    return Stack(alignment: Alignment.bottomCenter, children: [
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
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Contacts',
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Colors.white),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: chat.length,

                      ///user message screen
                      itemBuilder: (context, index) => InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5.75),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(
                                            chat[index].chatRoomPicture),
                                      ),
                                      // if (chatsData[index].isActive)
                                      //   Positioned(
                                      //     right: 0,
                                      //     bottom: 0,
                                      //     child: Container(
                                      //       height: 16,
                                      //       width: 16,
                                      //       decoration: BoxDecoration(
                                      //           color: Colors.green,
                                      //           shape: BoxShape.circle,
                                      //           border: Border.all(
                                      //               color: Colors.white,
                                      //               width: 3)),
                                      //     ),
                                      //   )
                                    ],
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          chat[index].chatRoomName,
                                          style: TextStyle(fontSize: 19),
                                        ),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          )))
            ],
          )),
    ]);
  }
}
