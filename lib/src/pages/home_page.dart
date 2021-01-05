import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_preferences/user_preferences.dart';

import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static final String routeName = 'home';

  static final UserPreferences prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('User preferences'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary color: ${prefs.secondaryColor}'),
          const Divider(),
          Text('Gender: ${prefs.gender}'),
          const Divider(),
          Text('User name: ${prefs.name}'),
          const Divider(),
        ],
      ),
    );
  }
}
