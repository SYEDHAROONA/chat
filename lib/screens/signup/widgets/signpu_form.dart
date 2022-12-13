import 'package:chat/screens/signup/widgets/firstname_text_field.dart';
import 'package:chat/screens/signup/widgets/lastname_text_field.dart';
import 'package:chat/screens/signup/widgets/signup_button.dart';
import 'package:chat/screens/signup/widgets/email_text_field.dart';
import 'package:chat/screens/signup/widgets/password_text_field.dart';
import 'package:chat/screens/signup/widgets/profile_image_picker.dart';
import 'package:chat/screens/signup/widgets/username_text_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const ProfileImage(),
      SizedBox(
        height: size.height * 0.02,
      ),
      const UsernameTextField(),
      const FirstnameTextField(),
      const LastnameTextField(),
      const EmailTextField(),
      const PasswordTextField(),
      const SignUpButton(),
      // SizedBox(
      //   height: size.height * 0.15,
      // ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account ? ',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 16,
              ),
            ),
          )
        ],
      )
    ]);
  }
}
