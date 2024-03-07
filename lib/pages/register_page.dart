// Register new user page

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isPasswordVisible =
      false; // Added variable to track password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Registrar nuevo usuario'), // Corregí la palabra "Registar"
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField(
              label: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextField(
              label:
                  'Contraseña', // Cambié "Password" a "Contraseña" para mantener el idioma
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            const SizedBox(height: 10),
            _buildElevatedButton(context),
            const SizedBox(height: 20),
            _buildTextWithStyle('¿Ya tienes una cuenta?', Colors.blue, 20),
            const SizedBox(height: 20),
            _buildTextButton(context),
          ],
        ),
      ),
    );
  }

  // Método para construir los campos de texto de manera consistente
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    bool isPassword = false,
  }) {
    return TextField(
      style: const TextStyle(fontSize: 20),
      cursorColor: Colors.blue,
      cursorHeight: 30,
      cursorWidth: 3,
      cursorRadius: const Radius.circular(10),
      cursorOpacityAnimates: true,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
      obscureText: isPassword && !_isPasswordVisible,
      maxLength: 30,
    );
  }

  // Método para construir el botón elevado de manera consistente
  Widget _buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          final UserCredential userCredential =
              await _auth.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);
          print(_auth.currentUser!.email);
          print("User: ${userCredential.user}");
          final User? user = userCredential.user;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Registro exitoso del usuario: ${user!.email}'),
            ),
          );
        } on FirebaseAuthException catch (e) {
          String errorMessage = 'Algo falló: ${e.message}';
          if (e.code == 'email-already-in-use') {
            errorMessage = 'El correo ya está registrado';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        onSurface: Colors.grey,
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        elevation: 5,
        minimumSize: const Size(200, 50),
        padding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        side: const BorderSide(
          width: 2,
          color: Colors.blue,
        ),
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      child: const Text('Registrar'),
    );
  }

  // Método para construir un texto con un estilo específico
  Widget _buildTextWithStyle(String text, Color color, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  // Método para construir un botón de texto de manera consistente
  Widget _buildTextButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
        onSurface: Colors.grey,
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        elevation: 5,
        minimumSize: const Size(200, 50),
        padding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        side: const BorderSide(
          width: 2,
          color: Colors.blue,
        ),
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white, // Cambié el color de blanco a negro
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/');
      },
      child: const Text('Iniciar sesión'),
    );
  }
}
