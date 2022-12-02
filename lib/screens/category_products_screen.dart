import 'package:flutter/material.dart';

class CategoryProductScreen extends StatelessWidget {
  final String title;
  const CategoryProductScreen({Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(title, style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Text('Hello World!'),
    );
  }
}
