import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Container(
            margin: const EdgeInsets.only(top: 10, left: 20),
            child: const Text(
              'Setting',
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 25),
            ),
          )),
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Colors.white),
          child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            "assets/images/user_2.png", //get from user
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 35, left: 10, right: 10),
                          child: const Text(
                            'imathelongestnameinth',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 530),
                      child: SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                            ),
                            onPressed: () {},
                            child: const Text('Sign out')),
                      ))
                ],
              ))),
    ]);
  }
}
