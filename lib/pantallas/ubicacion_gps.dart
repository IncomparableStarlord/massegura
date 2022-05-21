// ignore_for_file: avoid_print

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../reusable_widgets/menu.dart';

class Ubicacion extends StatelessWidget {
  const Ubicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GPS",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,

        //backgroundColor: Colors.redAccent,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(children: [
            ElevatedButton(
                onPressed: () async {
                  Location location = Location();
                  bool ison = await location.serviceEnabled();
                  if (!ison) {
                    //if defvice is off
                    bool isturnedon = await location.requestService();
                    if (isturnedon) {
                      print("El dispositivo GPS está ENCENDIDO");
                    } else {
                      print("El dispositivo GPS todavía está APAGADO");
                    }
                  }
                },
                child: const Text("Activar GPS por paquete de ubicación")),
            ElevatedButton(
                onPressed: () async {
                  AppSettings.openLocationSettings();
                },
                child: const Text("Activar GPS por de configuración"))
          ])),
      drawer: const menu(),
    );
  }
}
