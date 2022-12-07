import 'package:chat/router.dart';
import 'package:flutter/material.dart';

String initRoute = '/authen';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffffff),
      ),
      routes: map,
      initialRoute: initRoute,
    );
  }
}
