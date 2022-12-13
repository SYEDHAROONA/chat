import 'package:chat/screens/signup/widgets/signpu_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.height,
            width: size.width,
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.07, horizontal: size.width * 0.05),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: Colors.black,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ]),
          ),
          SingleChildScrollView(
            child: Container(
              height: size.height * 0.85,
              width: size.width,
              // color: Colors.white,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: const SignUpForm(),
            ),
          )
        ],
      ),
    );
  }
}
