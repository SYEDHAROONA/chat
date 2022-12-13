import 'dart:io';

import 'package:chat/provider/signup/create_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  Future<void> handleSignUp(BuildContext context) async {
    context.loaderOverlay.show();
    bool isAccountCreate =
        await Provider.of<CreateAccountProvider>(context, listen: false)
            .createAccount();

    context.loaderOverlay.hide();

    if (isAccountCreate) {
      Navigator.pop(context);
      showCreateAccountCompleteDialog(context);
    } else {
      showCreateAccountFailDialog(context);
    }
  }

  Future<void> showCreateAccountCompleteDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('Signup complete'),
            content: const Text('Your account has been created'),
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

  Future<void> showCreateAccountFailDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('Signup Failed'),
            content: const Text('This email has already registered'),
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

  Future<void> showEmptyFillDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('Please fill all fields'),
            content: const Text('Fill all fields and add your profile picture'),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.05,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
          onPressed: () {
            File? file =
                Provider.of<CreateAccountProvider>(context, listen: false).file;
            String username =
                Provider.of<CreateAccountProvider>(context, listen: false)
                    .username;
            String email =
                Provider.of<CreateAccountProvider>(context, listen: false)
                    .email;
            String password =
                Provider.of<CreateAccountProvider>(context, listen: false)
                    .password;
            String firstname =
                Provider.of<CreateAccountProvider>(context, listen: false)
                    .firstname;
            String lastname =
                Provider.of<CreateAccountProvider>(context, listen: false)
                    .lastname;

            if (file == null ||
                username.isEmpty ||
                password.isEmpty ||
                email.isEmpty ||
                firstname.isEmpty ||
                lastname.isEmpty) {
              showEmptyFillDialog(context);
              return;
            }
            handleSignUp(context);
          },
          child: const Text('Sign Up'),
        ),
      ),
    );
  }
}
