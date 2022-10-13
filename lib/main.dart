import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 90),
              Image.asset(
                'assets/images/logo.png',
                height: 80,
                width: 80,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to Lafyuu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff223263),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  color: Color(0xff9098B1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  prefixIcon: Icon(Icons.email)
                  // suffixIcon: Icon(Icons.)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
