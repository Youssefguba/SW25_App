import 'package:ecommerce_app_sw25/screens/home_screen.dart';
import 'package:ecommerce_app_sw25/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initApp();
  }

  void initApp() {
    Future.delayed(Duration(milliseconds: 2300), () async {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = await prefs.get('user_access_token');
      if (accessToken == null) {

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return LoginPage();
        }), (route) => false);

      } else {

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png', height: 80),
      ),
    );
  }
}
