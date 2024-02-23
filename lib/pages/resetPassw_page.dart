// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restablecer Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ingresa el código OTP para restablecer la contraseña',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildOTPTextField(),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // Aquí puedes implementar la lógica para verificar el OTP
                  // y permitir que el usuario restablezca la contraseña.
                  // Por ahora, simplemente muestra un mensaje.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Contraseña restablecida con éxito.'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(fontSize: 14, color: Colors.black),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Restablecer Contraseña',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Código OTP',
        hintText: 'Ingresa el código de verificación',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: const Icon(Icons.lock),
      ),
    );
  }
}
