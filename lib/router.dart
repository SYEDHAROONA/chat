import 'package:chat/screens/home/home_screen.dart';
import 'package:chat/screens/login/authen.dart';
import 'package:chat/screens/register/create_account.dart';
import 'package:chat/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => const Authen(),
  '/createAccount': (BuildContext context) => const CreateAccount(),
  '/signup': (context) => const SignUpScreen(),
  '/home':(context) => const HomePage(),
};
