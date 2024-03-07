import 'package:flutter/material.dart';
import 'package:flutter_app_2/firebase_options.dart';
import 'package:flutter_app_2/pages/homeOk_page.dart';
import 'package:flutter_app_2/pages/login_page.dart';
import 'package:flutter_app_2/pages/register_page.dart';
import 'package:flutter_app_2/pages/resetPassw_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/reset_password': (context) => const ResetPasswordPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => HomePageOk(
            userName: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}
