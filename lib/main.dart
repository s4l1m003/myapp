import 'package:flutter/material.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/login_screen.dart';
import 'success_screen.dart'; // Import the success screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), // The home screen
        '/login': (context) => LoginScreen(), // The login screen
        '/success': (context) => SuccessScreen(), // The success screen
      },
    );
  }
}
