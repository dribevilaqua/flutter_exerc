import 'package:flutter/material.dart';
import 'package:projeto01/service/prefs_service.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      PrefsService.isAuthenticated(),
      Future.delayed(const Duration(seconds: 2)),
    ]).then((value) {
      if (value[0] == true) {
        Navigator.of(context).pushReplacementNamed('/homepage');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade700,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white54,
        ),
      ),
    );
  }
}
