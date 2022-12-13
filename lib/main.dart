import 'package:chat/provider/login/login_provider.dart';
import 'package:chat/provider/signup/create_account_provider.dart';
import 'package:chat/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

String? token;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const storage = FlutterSecureStorage();
  token = await storage.read(key: 'accessToken');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => CreateAccountProvider())),
        ChangeNotifierProvider(create: ((context) => LoginProvider())),
      ],
      child: GestureDetector(
          onTap: (() {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          }),
          child: GlobalLoaderOverlay(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: const Color(0x00ffffff),
              ),
              routes: map,
              initialRoute: token == null ? '/authen' : '/home',
            ),
          )),
    );
  }
}
