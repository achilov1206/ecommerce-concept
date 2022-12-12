import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';
import '../../features/products/presentation/pages/home_page.dart';
import '../../features/products/presentation/pages/product_detail_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';

class Routes {
  static const String homeRoute = '/';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) => ProductDetailsPage());
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => CartPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
