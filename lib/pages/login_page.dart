import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

Future<void> signInWithEmailAndPassword(
    String email, String password, BuildContext context) async {
  try {
    // ignore: unused_local_variable
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    // Usuario inició sesión exitosamente, navegar a la página principal
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/home');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No se encontró ningún usuario con ese correo electrónico.');
    } else if (e.code == 'wrong-password') {
      print('Contraseña incorrecta para ese usuario.');
    }
  }
}

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return; // El usuario canceló el inicio de sesión

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User user = authResult.user!;
    print('Inició sesión con Google: ${user.displayName}');
    // Redirige al usuario a la pantalla principal (home) y mandar user para improimir en home
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/home', arguments: user.displayName);
  } catch (e) {
    print('Error al iniciar sesión con Google: $e');
  }
}

Future<UserCredential?> signInWithGitHub(BuildContext context) async {
  try {
    GithubAuthProvider githubProvider = GithubAuthProvider();
    githubProvider.addScope('read:user');
    githubProvider.addScope('user:email');
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithPopup(githubProvider);
    final User user = userCredential.user!;
    print('Inició sesión con GitHub: ${user.displayName}');
    // Redirige al usuario a la pantalla principal (home) y manda el nombre del usuario
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/home', arguments: user.displayName);
    return userCredential;
  } catch (e) {
    print('Error al iniciar sesión con GitHub: $e');
    return null; // Agrega este retorno nulo
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Fondo(),
          Contenido(
            emailController: emailController,
            passwordController: passwordController,
          ),
        ],
      ),
    );
  }
}

class Fondo extends StatelessWidget {
  const Fondo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 125, 190, 243),
            Colors.blue,
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
    );
  }
}

class Contenido extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const Contenido({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<Contenido> createState() => _ContenidoState();
}

class _ContenidoState extends State<Contenido> {
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Welcome to your count',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Datos(
            emailController: widget.emailController,
            passwordController: widget.passwordController,
          ),
          const SizedBox(
            height: 15,
          ),
          const _Politicas(),
        ],
      ),
    );
  }
}

class Datos extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const Datos({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black, fontSize: 15),
            autofocus: true,
            cursorColor: Colors.grey,
            cursorRadius: const Radius.circular(16),
            cursorWidth: 2.0,
            maxLength: 30,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
              hintText: 'micorreo@gmail.com',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Contraseña',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: showPass,
            style: const TextStyle(color: Colors.black, fontSize: 15),
            cursorColor: Colors.grey,
            cursorRadius: const Radius.circular(16),
            cursorWidth: 2.0,
            maxLength: 30,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                fillColor: Colors.blueAccent,
                hintText: '********',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  onPressed: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          const Remember(),
          const SizedBox(
            height: 20,
          ),
          const Botones(),
        ],
      ),
    );
  }
}

class Remember extends StatefulWidget {
  const Remember({Key? key}) : super(key: key);

  @override
  State<Remember> createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: checked,
          activeColor: Colors.blue,
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onChanged: (value) {
            setState(() {
              checked = value!;
            });
          },
        ),
        const Text('Recordar cuenta', style: TextStyle(fontSize: 15)),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/reset_password');
          },
          child: const Text(
            '¿Olvidó su contraseña?',
            style: TextStyle(fontSize: 12, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}

class Botones extends StatelessWidget {
  const Botones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              signInWithEmailAndPassword(
                  _emailController.text, _passwordController.text, context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Iniciando sesión...'),
                ),
              );
              // Si el usuario no existe, muestra un mensaje de error
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Usuario no encontrado'),
                ),
              );
              // Si la contraseña es incorrecta, muestra un mensaje de error
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contraseña incorrecta'),
                ),
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff142047)),
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¿No tienes una cuenta?',
              style: TextStyle(
                color: Color.fromARGB(255, 79, 77, 77),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                'Regístrate',
                style: TextStyle(
                  color: Color(0xff142047),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
          width: double.infinity,
        ),
        const Text(
          'O inicia sesión con:',
          style: TextStyle(
              color: Color.fromARGB(255, 90, 90, 90),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 25,
          width: double.infinity,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () => {signInWithGoogle(context)},
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: const Text(
              'Google',
              style: TextStyle(
                color: Color(0xff142047),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
          width: double.infinity,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () => {
              signInWithGitHub(context),
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: const Text(
              'GitHub',
              style: TextStyle(
                color: Color(0xff142047),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
          width: double.infinity,
        ),
      ],
    );
  }
}

class _Politicas extends StatelessWidget {
  const _Politicas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => {},
              child: const Text(
                'Leer los',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 232, 232),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => {},
              child: const Text(
                'Términos y Condiciones',
                style: TextStyle(
                  color: Color.fromARGB(255, 79, 77, 77),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
