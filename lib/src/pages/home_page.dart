import 'package:flutter/material.dart';

import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User preferences'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary color:'),
          const Divider(),
          Text('Gender:'),
          const Divider(),
          Text('User name:'),
          const Divider(),
        ],
      ),
    );
  }
}
