import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/pantallas/home_pantalla.dart';
import 'package:proyecto_final/reusable_widgets/reusable_widget.dart';
import 'package:proyecto_final/utils/color_utils.dart';

class RegistroPantalla extends StatefulWidget {
  const RegistroPantalla({Key? key}) : super(key: key);

  @override
  State<RegistroPantalla> createState() => _RegistroPantallaState();
}

class _RegistroPantallaState extends State<RegistroPantalla> {
  final TextEditingController _userNombreTextController =
      TextEditingController();
  final TextEditingController _userDniTextController = TextEditingController();
  final TextEditingController _userFechaNacTextController =
      TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _password2TextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Registrarse",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese Email", Icons.email_outlined, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese Nombres y Apellidos",
                    Icons.person_outline, false, _userNombreTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese su DNI", Icons.person_outline, false,
                    _userDniTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese su Fecha de Nacimiento",
                    Icons.person_outline, false, _userFechaNacTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingrese Contraseña", Icons.lock_outline,
                    true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Repita su Contraseña", Icons.lock_outline,
                    true, _password2TextController),
                const SizedBox(
                  height: 20,
                ),
                loginButton(context, "Registrarse", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    // ignore: avoid_print
                    print("Nueva cuenta creada");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }).onError((error, stackTrace) {
                    // ignore: avoid_print
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
