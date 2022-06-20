import 'package:commercialapp/utilities/routes.dart';
import 'package:commercialapp/views/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../views/screens/home_screen.dart';

Route<dynamic> onGenerateRouter(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginScreen(), settings: settings);
    case Routes.homePageRoute:
      return MaterialPageRoute(
          builder: (_) => const HomePage(), settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => const HomePage(), settings: settings);
  }
}
