import 'package:flutter/material.dart';
import 'package:projeto01/Controllers/login_controller.dart';

class LoginPage extends StatelessWidget {

  LoginController _controller = LoginController();

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
          Icon(Icons.people, size: 100,),
          TextField(decoration: InputDecoration(label: Text('Login' )),
          onChanged: _controller.setLogin,
          ),
          TextField( decoration: InputDecoration(label: Text('Senha' )), obscureText: true,
          onChanged: _controller.setPass,
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 10, 180, 10)), child: Text('Login'),
          ),
        ],
        ),
      ),
    );
  }
}