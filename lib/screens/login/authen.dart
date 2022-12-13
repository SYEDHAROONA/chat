import 'package:chat/screens/login/widgets/create_account_section.dart';
import 'package:chat/screens/login/widgets/login_form.dart';
import 'package:chat/screens/login/widgets/logo.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // double? screenWidth, screenheight;
  bool redEye = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //floatingActionButton: buildCreateAccount(),
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
          child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    const Logo(),
                    // ),
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    const LoginForm(),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    const CreateAccountSection()
                  ]))),
    );
  }
}
