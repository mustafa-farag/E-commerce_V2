import 'package:commercialapp/controllers/database_controller.dart';
import 'package:commercialapp/models/user_data.dart';
import 'package:commercialapp/services/auth.dart';
import 'package:commercialapp/utilities/enums.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;
  final database = FirestoreDatabase(user: '123');

  AuthController(
      {required this.auth,
      this.email = '',
      this.password = '',
      this.authFormType = AuthFormType.login});

  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(email: '', password: '', authFormType: formType);
  }

  String toggleText(String login, String register) {
    if (authFormType == AuthFormType.login) {
      return login;
    } else {
      return register;
    }
  }

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email, password);
      } else {
        await auth.registerWithEmailAndPassword(email, password);
        await database.setUserData(UserData(
          uid: documentIdFromLocalData(),
          email: email,
        ));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await auth.logout();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
