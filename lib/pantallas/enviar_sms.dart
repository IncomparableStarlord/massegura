// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

import '../reusable_widgets/menu.dart';

class EnviarSMS extends StatelessWidget {
  const EnviarSMS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//List<String> recipents = ["+51917926596", "8765432190"];
List<String> recipents = ["+51917926596", "+51928627832"];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enviar SMS"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text("Enviar Sms",
                style: Theme.of(context).accentTextTheme.button),
            onPressed: () {
              _sendSMS("SMS de Prueba", recipents);
            },
          ),
        ),
      ),
      drawer: const menu(),
    );
  }
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
