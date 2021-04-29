import 'package:flutter/material.dart';
import 'package:login/models/UserModel.dart';
import 'package:login/screens/guest/Auth.dart';
import 'package:login/screens/guest/Password.dart';
import 'package:login/screens/guest/Term.dart';
import 'package:login/screens/services/UserService.dart';

class GuestScreen extends StatefulWidget {
  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  UserService _userService = UserService();

  List<Widget> _widgets = [];
  int _indexSelected = 0;
  String _email;
  @override
  void initState() {
    super.initState();

    _widgets.addAll([
      AuthScreen(
        onChangeStep: (index, value) => setState(() {
          _indexSelected = index;
          _email = value;
        }),
      ),
      TermScreen(
          onChangeStep: (index) => setState(() => _indexSelected = index)),
      PasswordScreen(
        onChangeStep: (index, value) => setState(
          () {
            if (index != null) {
              _indexSelected = index;
            }
            if (index != null) {
              UserModel userModel = UserModel(
                email: _email,
                password: value,
              );
              print(userModel.toJson());
            }
          },
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
