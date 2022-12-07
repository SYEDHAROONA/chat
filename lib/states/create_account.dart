import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double? screenWidth, screenHeight;
  bool redEye = true;
  File? file;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          buildRegister(),
        ],
      ),
    );
  }

  Scaffold buildRegister() {
    return Scaffold(
        body: SafeArea(   
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildImageProfile(),
                buildUser(),
                buildEmail(),
                buildPassword(),
                buildCreateAccount(),
              ],
            ),
          ),
        ),
    ));
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      // ignore: deprecated_member_use
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildImageProfile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: file == null
                    ? CircleAvatar(
                        backgroundImage: AssetImage('images/profileLogo.png'),
                        minRadius: 50,
                        maxRadius: 75,
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(file!),
                        minRadius: 50,
                        maxRadius: 75,
                      )),
            Container(
              margin: EdgeInsets.only(top:125
              
              ,left: 100),
              child: IconButton( 
                onPressed: () => chooseImage(ImageSource.gallery),
                icon: Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Container buildCreateAccount() {
    return Container(
        margin: EdgeInsets.only(top: 40),
        width: screenWidth! * 0.4,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100, 50),
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: () {},
            child: Text('Create Account')));
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

  Container buildEmail() {
    return Container(
        margin: EdgeInsets.only(top: 16),
        width: screenWidth! * 0.65,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.orangeAccent,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            labelStyle: TextStyle(color: Colors.white),
            labelText: 'E-mail:',
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
}