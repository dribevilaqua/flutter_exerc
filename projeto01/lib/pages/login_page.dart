import 'package:flutter/material.dart';
import 'package:projeto01/Controllers/login_controller.dart';
import 'package:projeto01/components/custom_login_button_%20component.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: 100),
            TextField(
              decoration: InputDecoration(label: Text('Login')),
              onChanged: _controller.setLogin,
            ),
            TextField(
              decoration: InputDecoration(label: Text('Senha')),
              obscureText: true,
              onChanged: _controller.setPass,
            ),
            SizedBox(height: 20),
            CustomLoginButtonComponent(
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
