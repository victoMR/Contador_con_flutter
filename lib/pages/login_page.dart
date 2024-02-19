import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          // Fondo
          _Fondo(),
          // Formulario
          _Formulario(),
          // Boton
          _Boton(),
        ],
      ),
    );
  }
}

// Fondo de la pagina
class _Fondo extends StatelessWidget {
  const _Fondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp, // esto hace que se repita el gradiente
        transform: GradientRotation(10.52551), // rotacion del gradiente
        stops: [0.0, 1.0], // inicio y fin del gradiente
        colors: [Color(0xff099ef3), Color(0xff57c2ff)],
      ),
    ));
  }
}

// Formulario de la pagina
class _Formulario extends StatefulWidget {
  const _Formulario({super.key});

  @override
  State<_Formulario> createState() => __FormularioState();
}

class __FormularioState extends State<_Formulario> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Bienvenido a tu cuenta',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          SizedBox(height: 20),
          // Input
          _Input(),
        ],
      ),
    );
  }
}

// Input de la pagina
class _Input extends StatefulWidget {
  const _Input({super.key});

  @override
  State<_Input> createState() => __InputState();
}

class __InputState extends State<_Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Correo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
          const SizedBox(height: 5),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'ejemplo@correo.com',
              hintStyle: const TextStyle(color: Colors.grey),
              focusColor: Colors.blueAccent,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blueAccent),
              ),
            ),
            autocorrect: false,
            autofillHints: const [AutofillHints.email],
            cursorColor: Colors.grey,
            cursorRadius: const Radius.circular(5),
            cursorWidth: 2,
            cursorOpacityAnimates: true,
            obscureText: false,
            autofocus: true,
          ),
          const SizedBox(height: 20),
          const Text('Contraseña',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
          const SizedBox(height: 5),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: '*********',
              suffixIcon: IconButton(
                onPressed: () {},
                color: Colors.black,
                focusColor: Colors.blueAccent,
                icon: const Icon(Icons.remove_red_eye),
                selectedIcon: const Icon(Icons.remove_red_eye_outlined),
                iconSize: 20,
              ),
              hintStyle: const TextStyle(color: Colors.grey),
              focusColor: Colors.blueAccent,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
            autocorrect: false,
            autofillHints: const [AutofillHints.password],
            cursorColor: Colors.grey,
            cursorRadius: const Radius.circular(5),
            cursorWidth: 2,
            cursorOpacityAnimates: true,
            autofocus: false,
            // Falta el boton (ojo) de mostrar contraseña
          ),
          const SizedBox(height: 20),
          // Boton
          const _Boton(),
        ],
      ),
    );
  }
}

// Boton de la pagina
class _Boton extends StatelessWidget {
  const _Boton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Path: lib/pages/login_page.dart
