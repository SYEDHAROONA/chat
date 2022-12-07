import 'package:chat/utility/my_style.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double? screenWidth, screenheight;
  bool redEye = true;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      //floatingActionButton: buildCreateAccount(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildLogo(),
                buildUser(),
                buildPassword(),
                buildSignIn(),
                buildCreateAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildCreateAccount() {
    return Container(
      margin: EdgeInsets.only(top:200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
          ),
          Text(
            'Don\'t have an Account ?',
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
              onPressed: () => Navigator.pushNamed(context, '/createAccount'),
              child: const Text(
                'Create Account',
                style: TextStyle(color: Colors.orange),
              ))
        ],
      ),
    );
  }

  Container buildUser() {
    return Container(
        margin: EdgeInsets.only(top: 16),
        width: screenWidth! * 0.65,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.orangeAccent,
            prefixIcon: Icon(
              Icons.perm_identity,
              color: Colors.white,
            ),
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Username:',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.orange)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.orange),
            ),
          ),
        ));
  }

  Container buildPassword() {
    return Container(
        margin: EdgeInsets.only(top: 16),
        width: screenWidth! * 0.65,
        child: TextField(
          obscureText: redEye,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.orangeAccent,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    redEye = !redEye;
                  });
                },
                icon: Icon(
                  redEye
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_sharp,
                  color: Colors.white,
                )),
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'Password:',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.orange)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.orange),
            ),
          ),
        ));
  }

  Container buildSignIn() {
    return Container(
        margin: EdgeInsets.only(top: 16),
        padding: const EdgeInsets.fromLTRB(130, 0, 10, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(100, 50),
              backgroundColor: Colors.orange,
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
          child: const Text('Login'),
          onPressed: () {},
        ));
  }

  Container buildLogo() {
    return Container(
        height: screenheight! * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/chatLogo.png')),
          ],
        ));
  }
}
