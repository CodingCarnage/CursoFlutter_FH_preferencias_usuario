import 'package:flutter/material.dart';

import 'package:preferencias_usuario/src/shared_preferences/user_preferences.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _gender;

  TextEditingController _textEditingController;
  static final UserPreferences prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    prefs.lastPage = SettingsPage.routeName;
    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _textEditingController = new TextEditingController(text: prefs.name);
  }

  _setSelectedRadio(int value) {
    prefs.gender = value;
    _gender = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            child: Text(
              'Personal settings',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text('Secondary color'),
            onChanged: (bool value) {
              setState(() {
                _secondaryColor = value;
                prefs.secondaryColor = value;
              });
            },
          ),
          const Divider(),
          RadioListTile(
            value: 1,
            title: Text('Male'),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Female'),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Name',
                helperText: 'Name of the person using the phone',
              ),
              onChanged: (String value) {
                prefs.name = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
