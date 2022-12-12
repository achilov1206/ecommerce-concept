import 'package:dio/dio.dart';
import 'package:ecommerce/features/products/data/api/product_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/resources/theme_manager.dart';
import '../core/services/connectivity_service.dart';
import '../core/routes/routes_manager.dart';
import '../features/cart/data/api/cart_api_service.dart';
import '../features/cart/data/repositories/cart_repository.dart';
import '../features/products/data/repositories/product_repository.dart';
import '../features/products/data/repositories/product_info_repository.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CartRepository(CartApiService(dio)),
        ),
        RepositoryProvider(
          create: (context) => ConnectivityService(),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(ProductApiService(dio)),
        ),
        RepositoryProvider(
          create: (context) => ProductInfoRepository(ProductApiService(dio)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.homeRoute,
        theme: getApplicationTheme(),
      ),
    );
  }
}
