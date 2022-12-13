// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:chat/Service/Apiservice.dart';
import 'package:chat/screens/home/chat/Chatroom.dart';
import 'package:chat/screens/home/contact_screen.dart';
import 'package:chat/screens/home/setting_screen.dart';
import 'package:chat/screens/model/chatroommodel.dart';
import 'package:chat/screens/model/usermodel.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  ApiService service = ApiService();
  static late Usermodel user;
  static late List<Chatroommodel> chatroom;
  List screen = [
    Chatroom(chat: chatroom, user: user),
    const ContactScreen(),
    const SettingScreen(),
  ];

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    user = await service.getUsers();
    chatroom = await service.getchatroom();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screen[_selectedIndex],
        bottomNavigationBar: buildbottomnavigationbar(),
      ),
    );
  }

  BottomNavigationBar buildbottomnavigationbar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
          BottomNavigationBarItem(
              label: "profile",
              icon: CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(user.profilePicture),
              ))
        ]);
  }
}
