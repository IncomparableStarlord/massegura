import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/pantallas/login_pantalla.dart';
import 'package:proyecto_final/pantallas/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iniciar Sesion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const SplashScreen(),
      initialRoute: SplashScreen.id,
      routes: {
        LoginPantallas.id: (context) => const LoginPantallas(),
      },
    );
  }
}
