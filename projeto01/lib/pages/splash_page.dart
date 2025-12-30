import 'package:flutter/material.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) => 
      Navigator.of(context).pushReplacementNamed('/login')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade700, 
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white54,
        ),)
    );
  }
}
