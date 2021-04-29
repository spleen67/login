import 'dart:ui';

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int, String) onChangeStep;

  AuthScreen({
    Key key,
    this.onChangeStep,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailregexp =
      RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
  String _email = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Everyone has\n'.toUpperCase(),
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                  children: [
                    TextSpan(
                      text: 'Knowledge\n'.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'to share.'.toUpperCase(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'It all starts here',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Enter your e-mail'),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) => setState(() => _email = value),
                      validator: (value) =>
                          value.isEmpty || !emailregexp.hasMatch(value)
                              ? "Merci d'entrer une adresse email valide"
                              : null,
                      decoration: InputDecoration(
                        hintText: 'EX: john.doe@test.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: !emailregexp.hasMatch(_email)
                          ? null
                          : () {
                              if (_formKey.currentState.validate()) {
                                print(_email);
                                widget.onChangeStep(1, _email);
                              }
                            },
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'continue'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
