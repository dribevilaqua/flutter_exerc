import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          TextField(decoration: InputDecoration(label: Text('Login' )),) ,
          TextField( decoration: InputDecoration(label: Text('Senha' )), obscureText: true,),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 10, 180, 10)), child: Text('Login'),
          )
        ],
        ),
      ),
    );
  }
}