import 'package:flutter/material.dart';
// import 'package:flutter_app_2/pages/home_page.dart';
import 'package:flutter_app_2/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Super es el constructor de la clase padre

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LoginPage(),
    );
  }
}
