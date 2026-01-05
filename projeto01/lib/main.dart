import 'package:flutter/material.dart';
import 'package:projeto01/pages/details_page.dart';
import 'package:projeto01/pages/home_page.dart';
import 'package:projeto01/pages/login_page.dart';
import 'package:projeto01/pages/splash_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      //rotas
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const Splashpage(),
        '/login': (_) => LoginPage(),
        '/homepage': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
      },
    );
  }
}