import 'package:ecommerce_app_sw25/screens/home_screen.dart';
import 'package:ecommerce_app_sw25/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "example@gmail.com",
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
                  validator: (text) {
                    if (text!.length < 6) {
                      return "Name Should be more than 6 char";
                    }
                    return null;
                  },
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
                  if (formKey.currentState!.validate()) {
                    register();
                  }
                },
                child: Text('Sign Up / Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    try {
      var response = await Dio().post('https://api.escuelajs.co/api/v1/users/', data: {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));

      print(response);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error in email or password'),
          backgroundColor: Colors.red,
        ),
      );
      print(e);
    }
  }
}
