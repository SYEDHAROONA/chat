import 'package:chat/screens/model/chatroommodel.dart';
import 'package:flutter/material.dart';

class Chatcard extends StatelessWidget {
  const Chatcard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chatroommodel chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(chat.chatRoomPicture),
                ),
                // if (chat.isActive)
                //   Positioned(
                //     right: 0,
                //     bottom: 0,
                //     child: Container(
                //       height: 16,
                //       width: 16,
                //       decoration: BoxDecoration(
                //           color: Colors.green,
                //           shape: BoxShape.circle,
                //           border: Border.all(color: Colors.white, width: 3)),
                //     ),
                //   )
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.chatRoomName,
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(chat.lastmessage)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
