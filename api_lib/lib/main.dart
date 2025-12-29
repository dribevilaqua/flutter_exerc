import 'package:api_lib/one_page.dart';
import 'package:flutter/material.dart';

//baseado no WIDGETS_PERSONALIZADOS

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnePage(),
    );
  }
}