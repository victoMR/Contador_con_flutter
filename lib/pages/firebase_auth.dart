import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final Logger logger = Logger();

Future<User?> registerWithEmailAndPassword(
    String email, String password) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Usuario registrado exitosamente
    return userCredential.user;
  } catch (e) {
    // Error al registrar el usuario
    logger.e("Error al registrar el usuario: $e");
    return null;
  }
}

Future<User?> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Usuario inició sesión exitosamente
    return userCredential.user;
  } catch (e) {
    // Error al iniciar sesión
    logger.e("Error al iniciar sesión: $e");
    return null;
  }
}

Future<User?> register(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Usuario registrado exitosamente
    return userCredential.user;
  } catch (e) {
    // Error al registrar el usuario
    logger.e("Error al registrar el usuario: $e");
    return null;
  }
}
