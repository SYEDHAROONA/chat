import 'dart:convert';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:chat/provider/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.orangeAccent,
                hintText: 'email',
                prefixIcon: const Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                hintStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.orange)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
              ),
              onChanged: (value) {
                Provider.of<LoginProvider>(context, listen: false).email =
                    value;
              },
            )),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: TextField(
              obscureText: !visible,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.orangeAccent,
                hintText: 'password',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: Icon(
                      !visible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    )),
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.orange)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
              ),
              onChanged: ((value) {
                Provider.of<LoginProvider>(context, listen: false).password =
                    value;
              }),
            )),
        const SizedBox(
          height: 30,
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(130, 0, 10, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 50),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: const Text('Login'),
              onPressed: () {
                handleLogin(context);
              },
            ))
      ],
    );
  }

  handleLogin(BuildContext context) async {
    String email = Provider.of<LoginProvider>(context, listen: false).email;
    String password =
        Provider.of<LoginProvider>(context, listen: false).password;
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    context.loaderOverlay.show();

    var canLogin =
        await Provider.of<LoginProvider>(context, listen: false).login();
        
    if (Provider.of<LoginProvider>(context, listen: false).isLoading == false) {
      context.loaderOverlay.hide();
    }
    if (canLogin) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: const Text('Signin Failed'),
              content: const Text('Fill correct username and password'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('close'))
              ],
            );
          }));
    }
  }
}
