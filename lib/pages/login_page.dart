//importM
import 'package:flutter/material.dart';

//stfulW
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
        Fondo(),
        Contenido(),
      ],
    ));
  }
}

//statelessW
class Fondo extends StatelessWidget {
  const Fondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //min propiedad may widget, los wid aceptan propiedades
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 125, 190, 243),
          Colors.blue,
        ],
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
      )),
    );
  }
}

//StatefulW
class Contenido extends StatefulWidget {
  const Contenido({super.key});

  @override
  State<Contenido> createState() => _ContenidoState();
}

class _ContenidoState extends State<Contenido> {
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
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Welcome to your count',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 12),
          Datos(),
          SizedBox(
            height: 15,
          ),
          _Politicas(),
        ],
      ),
    );
  }
}

class Datos extends StatefulWidget {
  const Datos({super.key});

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
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black, fontSize: 15),
            autofocus: true,
            cursorColor: Colors.grey,
            cursorRadius: const Radius.circular(16),
            cursorWidth: 2.0,
            maxLength: 30,
            decoration: InputDecoration(
              // Personalizar el borde cuando no está seleccionado
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
              // Personalizar el borde cuando está seleccionado
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
            'Password',
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
                // Personalizar el borde cuando está seleccionado
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                fillColor: Colors.blueAccent,
                hintText: '********',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  onPressed: () => {
                    setState(() {
                      showPass == true ? showPass = false : showPass = true;
                    })
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

// si va a tener funcionamiento  statefulW

class Remember extends StatefulWidget {
  const Remember({super.key});

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
          onChanged: (value) => {
            setState(() {
              checked == false ? checked = true : checked = false;
            }),
          },
        ),
        const Text('Recordar', style: TextStyle(fontSize: 15)),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/reset_password');
          },
          child: const Text(
            'Olvidaste Contraseña?',
            style: TextStyle(fontSize: 12, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}

class Botones extends StatelessWidget {
  const Botones({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () => {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff142047))),
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
        const Text(
          'Or login with',
          style: TextStyle(color: Color.fromARGB(255, 79, 77, 77)),
        ),
        const SizedBox(
          height: 25,
          width: double.infinity,
        ),
        SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
                onPressed: () => {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                child: const Text(
                  'Google',
                  style: TextStyle(
                      color: Color(0xff142047),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ))),
        const SizedBox(
          height: 15,
          width: double.infinity,
        ),
        SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
                onPressed: () => {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                child: const Text(
                  'Facebook',
                  style: TextStyle(
                      color: Color(0xff142047),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ))),
        const SizedBox(
          height: 30,
          width: double.infinity,
        ),
      ],
    );
  }
}

class _Politicas extends StatelessWidget {
  const _Politicas({super.key});

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
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => {},
              child: const Text(
                'Terminos y Condiciones',
                style: TextStyle(
                    color: Color.fromARGB(255, 79, 77, 77),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
