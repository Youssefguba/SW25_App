import 'package:ecommerce_app_sw25/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class RegisterPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: TextFormField(
                controller: emailController,
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
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  prefixIcon: Icon(Icons.person),
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
                controller: passwordController,
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
            ElevatedButton(
              onPressed: () {
                print(emailController.text);
                print(nameController.text);
                print(passwordController.text);
                register();
              },
              child: Text('Sign Up / Register'),
            ),
          ],
        ),
      ),
    );
  }

  void register() async {
    try {
      var response = await Dio().post('https://api.escuelajs.co/api/v1/users/',
          data: {
            "name": nameController.text,
            "email": emailController.text,
            "password": passwordController.text,
            "avatar": "https://api.lorem.space/image/face?w=640&h=480"
          });
      print(response);
      print('Hello World!!');
    } catch (e) {
      print(e);
    }
  }
}
