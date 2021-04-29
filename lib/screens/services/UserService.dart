import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/models/UserModel.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> auth(UserModel userModel) async {
    UserCredential userCredential = await _auth.signInAnonymously();
    print(userCredential.user);
  }
}
