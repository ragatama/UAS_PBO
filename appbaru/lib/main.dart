import 'package:appbaru/oop_demo_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OOP Concepts Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/oop_demo': (context) => const MyHomePage(title: 'OOP Concepts Demo'),
      },
    );
  }
}

// Sisanya tetap sama seperti sebelumnya (MyHomePage, Vehicle, Car, Motorcycle)