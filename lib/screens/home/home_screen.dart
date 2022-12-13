import 'package:chat/screens/home/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List screens = [
    ChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ChatScreen(),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.amber,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Chats"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "People"),
              BottomNavigationBarItem(
                  label: "profile",
                  icon: CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(
                        'https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg'),
                  ))
            ]),
      ),
    );
  }
}
