import 'package:flutter/material.dart';

import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = true;
  int _gender = 1;
  String _name = 'Pedro';

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
            title: const Text('Secondary color'),
            onChanged: (bool value) {
              setState(() {
                _secondaryColor = value;
              });
            },
          ),
          const Divider(),
          RadioListTile(
            value: 1,
            title: const Text('Male'),
            groupValue: _gender,
            onChanged: (int value) {
              setState(() {
                _gender = value;
              });
            },
          ),
          RadioListTile(
            value: 2,
            title: const Text('Female'),
            groupValue: _gender,
            onChanged: (int value) {
              setState(() {
                _gender = value;
              });
            },
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'Name',
                helperText: 'Name of the person using the phone',
              ),
              onChanged: (String value) {
                setState(() {
                  _name = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
