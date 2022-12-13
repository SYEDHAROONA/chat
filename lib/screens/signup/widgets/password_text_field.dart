import 'package:chat/provider/signup/create_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visible = false;
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
        obscureText: !visible,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.lock, color: Colors.white),
          hintText: 'password',
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: IconButton(
            onPressed: (() {
              setState(() {
                visible = !visible;
              });
            }),
            icon: Icon(
              !visible ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
        onChanged: (value) {
          Provider.of<CreateAccountProvider>(context, listen: false).password =
              value;
        },
      ),
    );
  }
}
