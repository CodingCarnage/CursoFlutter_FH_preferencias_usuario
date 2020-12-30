import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User preferences'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Color secundario:'),
          const Divider(),
          const Text('Genero :'),
          const Divider(),
          const Text('Nombre usuario:'),
          const Divider(),
        ],
      ),
    );
  }
}