import 'package:flutter/material.dart';

import '../pantallas/enviar_sms.dart';
import '../pantallas/home_pantalla.dart';
import '../pantallas/leer_contacto.dart';
import '../pantallas/tutorial_app.dart';
import '../pantallas/ubicacion_gps.dart';
import '../utils/color_utils.dart';

// ignore: camel_case_types
class menu extends StatelessWidget {
  const menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("CB2B93"),
                //hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/images/Logo1.png',
                      alignment: Alignment.center, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('GPS'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Ubicacion()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('SMS'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EnviarSMS()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Video'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const YT()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Mis Ayudas'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Leer Contactos'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LeerContactos()));
            },
          ),
        ],
      ),
    );
  }
}
