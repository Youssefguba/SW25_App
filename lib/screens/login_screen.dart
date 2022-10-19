import 'package:ecommerce_app_sw25/screens/home_screen.dart';
import 'package:ecommerce_app_sw25/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 12,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 12,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 190,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }), (route) => false);
                  },
                  child: Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff40bfff),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.25,
                      color: Colors.grey),
                  SizedBox(width: 10),
                  Text('OR', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 10),
                  Container(height: 1, width: 100, color: Colors.grey),
                ],
              ),
              Container(
                width: 190,
                child: TextButton.icon(
                  onPressed: () {
                    print('Hello World!');
                  },
                  label: Text('Login with Google'),
                  icon: Icon(Icons.g_mobiledata_rounded),
                ),
              ),
              Container(
                width: 190,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return RegisterPage();
                    }), (route) => false);
                  },
                  label: Text('SignUp'),
                  icon: Icon(Icons.email),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
