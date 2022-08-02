import 'package:commercialapp/models/product_model.dart';
import 'package:commercialapp/utilities/routes.dart';
import 'package:commercialapp/views/screens/auth_screen.dart';
import 'package:commercialapp/views/screens/bottomnavbar_screen.dart';
import 'package:commercialapp/views/screens/product_details.dart';
import 'package:flutter/material.dart';

import '../views/screens/landing_screen.dart';

Route<dynamic> onGenerateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.bottomNavBarScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const BottomNavBarScreen(), settings: settings);
    case AppRoutes.authScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const AuthScreen(), settings: settings);
    case AppRoutes.landingScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const LandingScreen(), settings: settings);
    case AppRoutes.productDetails:
      final product = settings.arguments as Products ;
      return MaterialPageRoute(builder: (_) => ProductDetails(product: product) );
    default:
      return MaterialPageRoute(
          builder: (_) => const LandingScreen(), settings: settings);
  }
}
