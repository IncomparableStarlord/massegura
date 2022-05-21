// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/pantallas/home_pantalla.dart';
import 'package:proyecto_final/pantallas/recuperar_password.dart';
import 'package:proyecto_final/pantallas/register_pantalla.dart';
import 'package:proyecto_final/reusable_widgets/reusable_widget.dart';
import 'package:proyecto_final/services/firebase_services.dart';
import 'package:proyecto_final/utils/color_utils.dart';

class LoginPantallas extends StatefulWidget {
  const LoginPantallas({Key? key}) : super(key: key);
  static String id = "LoginPantallas";
  @override
  State<LoginPantallas> createState() => _LoginPantallasState();
}

class _LoginPantallasState extends State<LoginPantallas> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/Logo1.png"),
                reusableTextField(
                  "Ingrese usuario",
                  Icons.email_outlined,
                  false,
                  _emailTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese Contraseña", Icons.lock_outline,
                    true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                recuperarPassword(context),
                loginButton(context, "Iniciar Sesión", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                    print("Email: ${_emailTextController.toString()}");
                    print("Clave: ${_passwordTextController.toString()}");
                  });
                }),
                registerOption(),
                const SizedBox(
                  height: 20,
                ),
                loginGoogle(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row registerOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No tienes cuenta? ",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistroPantalla()));
          },
          child: const Text(
            "Registrarse",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget recuperarPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Olvidé mi contraseña",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RecuperarPassword())),
      ),
    );
  }

  Widget loginGoogle(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseServices().signInWithGoogle();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          })),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo_google.png",
                  width: 40,
                  height: 40,
                ),
                const Text(
                  "Iniciar con Gmail",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
