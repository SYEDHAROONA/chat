import 'package:chat/states/authen.dart';
import 'package:chat/states/create_account.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> map = {
  '/authen':(BuildContext context)=>Authen(),
  '/createAccount':(BuildContext context) => CreateAccount(),
};
