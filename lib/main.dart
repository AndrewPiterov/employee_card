import 'package:employee_card/app.dart';
import 'package:employee_card/app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initApp();

  runApp(const MyApp());
}
