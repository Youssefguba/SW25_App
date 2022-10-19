import 'package:ecommerce_app_sw25/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), (route) => false);
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
