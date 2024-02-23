import 'package:flutter/material.dart';
import 'package:flutter_app_2/pages/login_page.dart';
import 'package:flutter_app_2/pages/resetPassw_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/', // Página de inicio
      routes: {
        '/': (context) => const LoginPage(),
        '/reset_password': (context) =>
            const ResetPasswordPage(), // Ruta para la nueva página
      },
    );
  }
}
