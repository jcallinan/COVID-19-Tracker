// home_material.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'package:http/http.dart' as http;
Future<User> sendEvent(String firstName, String lastName, String temperature, String dateTimeTaken,String notes) async {
  final http.Response response = await http.post(
    'https://server/service',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstName': firstName,
      'lastName': lastName,
      'temperature': temperature,
      'dateTimeTaken': dateTimeTaken,
      'notes': notes
    }),
  );

  if (response.statusCode == 201) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(MaterialApp(
title: 'Flutter Database Example',
home: MyApp(), ));
class MyApp extends StatefulWidget {
  @override
  _COVIDCollectDataState createState() => _COVIDCollectDataState();
}

class _COVIDCollectDataState extends State {

  Future<User> futureUser;
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
                              } else {
                                return '';
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
                                else {
                                  return '';
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
                                } else {
                                  return '';
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
                                    setState(() {

                                      futureUser = sendEvent(_user.firstName,_user.lastName,_user.dateTimeTaken,_user.temperature.toString(),_user.notes);
                                      _user.firstName = "";
                                      _user.lastName = "";
                                      _user.temperature = 0;
                                      _user.dateTimeTaken = "";
                                      _user.notes = "";
                                    });
                                   /* if (form.validate()) {
                                      form.save();
                                      _user.save();
                                      _showDialog(context);
                                    }*/
                                  },
                                  child: Text('Save')),

                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            child: RaisedButton(
                                onPressed: () {
                               _user.firstName = "";
                               _user.lastName = "";
                               _user.temperature = 0;
                               _user.dateTimeTaken = "";
                               _user.notes = "";

                                },
                                child: Text('Reset')),

                          ),
                        ]))
            )
        )
    );
  }
  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}