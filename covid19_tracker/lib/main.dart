// home_material.dart
import 'package:flutter/material.dart';
import 'models/user.dart';
void main() => runApp(MaterialApp(
title: 'Flutter Database Example',
home: MyApp(), ));
class MyApp extends StatefulWidget {
  @override
  _COVIDCollectDataState createState() => _COVIDCollectDataState();
}

class _COVIDCollectDataState extends State {
  final _formKey = GlobalKey();
  final _user = User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Event')),
        body: Container(
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'First name'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.firstName = val),
                          ),
                          TextFormField(
                              decoration:
                              InputDecoration(labelText: 'Last name'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your last name.';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.lastName = val)),
                          TextFormField(
                              decoration:
                              InputDecoration(labelText: 'Temperature'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter the temperature taken.';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.temperature = double.tryParse(val))),
                          TextFormField(
                              decoration:
                              InputDecoration(labelText: 'Date / Time'),

                              onSaved: (val) =>
                                  setState(() => _user.dateTimeTaken = val)),

                          TextFormField(
                              decoration:
                              InputDecoration(labelText: 'Notes'),

                              onSaved: (val) =>
                                  setState(() => _user.notes = val)),

                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    final form = _formKey.currentState;
                                   /* if (form.validate()) {
                                      form.save();
                                      _user.save();
                                      _showDialog(context);
                                    }*/
                                  },
                                  child: Text('Save'))),
                        ])))));
  }
  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}