import 'package:flutter/material.dart';

import './app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  //Load smth
  await Future.delayed(const Duration(seconds: 10));
}
