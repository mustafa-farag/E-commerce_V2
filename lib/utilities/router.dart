import 'package:commercialapp/controllers/database_controller.dart';
import 'package:commercialapp/utilities/routes.dart';
import 'package:commercialapp/views/screens/auth_screen.dart';
import 'package:commercialapp/views/screens/bottomnavbar_screen.dart';
import 'package:commercialapp/views/screens/checkout/add_shipping_address.dart';
import 'package:commercialapp/views/screens/checkout/checkout_screen.dart';
import 'package:commercialapp/views/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    case AppRoutes.productDetailsRoute:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      final database = args['database'];
      return MaterialPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: ProductDetails(product: product),
        ),
      );
    case AppRoutes.checkoutRoute:
      final database = settings.arguments as Database;
      return MaterialPageRoute(
          builder: (_) => Provider<Database>.value(
                value: database,
                child: const CheckoutScreen(),
              ),
          settings: settings);
    case AppRoutes.addShippingAddressRoute:
      final database = settings.arguments as Database;
      return MaterialPageRoute(
          builder: (_) => Provider<Database>.value(
            value: database,
            child: const AddShippingAddressScreen(),
          ),
          settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => const LandingScreen(), settings: settings);
  }
}
