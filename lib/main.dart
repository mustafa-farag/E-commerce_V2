import 'package:commercialapp/services/auth.dart';
import 'package:commercialapp/utilities/router.dart';
import 'package:commercialapp/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_)=> Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(211, 38, 38, 1),
          scaffoldBackgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        ),
        onGenerateRoute: onGenerateRouter,
        initialRoute: AppRoutes.landingScreenRoute ,
      ),
    );
  }
}

