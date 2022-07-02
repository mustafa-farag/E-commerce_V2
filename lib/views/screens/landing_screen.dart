import 'package:commercialapp/controllers/auth_controller.dart';
import 'package:commercialapp/controllers/database_controller.dart';
import 'package:commercialapp/services/auth.dart';
import 'package:commercialapp/views/screens/auth_screen.dart';
import 'package:commercialapp/views/screens/bottomnavbar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return ChangeNotifierProvider<AuthController>(
                  create: (_) => AuthController(auth: auth),
                  child: const AuthScreen());
            } else {
              return ChangeNotifierProvider<AuthController>(
                  create: (_) => AuthController(auth: auth),
                  child: Provider<Database>(
                    create: (_) => FirestoreDatabase(user: user.uid),
                      child: const BottomNavBarScreen()));
            }
          }
          // TODO: We will refactor this to make one component for loading
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
