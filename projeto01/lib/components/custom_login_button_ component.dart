import 'package:flutter/material.dart';
import 'package:projeto01/Controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController controller;

  const CustomLoginButtonComponent({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.inLoader,
      builder: (_, inLoader, _) => inLoader
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                controller.auth().then((result) {
                  if (result) {
                    Navigator.of(context)
                        .pushReplacementNamed('/homepage');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Falha ao realizar login'),
                        duration: Duration(seconds: 5),
                        action: SnackBarAction(
                          label: 'ACTION',
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 10, 180, 10),
              ),
              child: Text('Login'),
            ),
    );
  }
}
