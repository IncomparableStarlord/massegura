// ignore_for_file: avoid_print, deprecated_member_use

import 'dart:async';
// ignore: avoid_web_libraries_in_flutter

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/pantallas/login_pantalla.dart';
//import 'package:permission_handler/permission_handler.dart';
import '../reusable_widgets/menu.dart';
import '../services/firebase_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//class _HomeScreenState extends State<HomeScreen> {
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _saludoBienvenida(context));
  }

  @override
  /*Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home",
            textAlign: TextAlign.center,
          ),
        ),
        drawer: menu(),
      ),
    );
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/btn_panico.png',
                alignment: Alignment.topCenter,
                width: 340,
                height: 340,
              ),
            ),
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            const SizedBox(
              height: 20,
            ),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            ElevatedButton(
              child: const Text("Cerrar Sesión"),
              onPressed: () async {
                FirebaseAuth.instance.signOut().then((value) async {
                  print("Sesión Cerrada");
                  await FirebaseServices().signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPantallas()));
                });
              },
            ),
          ],
        ),
      ),
      drawer: const menu(),
    );
  }
}

Future _saludoBienvenida(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Bienvenido a +Segura "),
      content: Text("${FirebaseAuth.instance.currentUser!.displayName}"),
      actions: [
        TextButton(
            onPressed: () => {print("De acuerdo"), Navigator.pop(context)},
            child: const Text("De acuerdo"))
      ],
    ),
  );
}
