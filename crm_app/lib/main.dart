import 'package:flutter/material.dart';
import 'customer_page.dart'; // Import your customer page
import 'home_page.dart'; // Import your home page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Set the home page to your home page
    );
  }
}
