import 'package:chat/provider/signup/create_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstnameTextField extends StatelessWidget {
  const FirstnameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.orangeAccent),
      child: TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.email, color: Colors.white),
          hintText: 'firstname',
          hintStyle: TextStyle(color: Colors.white),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
        onChanged: (value) {
          Provider.of<CreateAccountProvider>(context, listen: false).firstname =
              value;
        },
      ),
    );
  }
}
