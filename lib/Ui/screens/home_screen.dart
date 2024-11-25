import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const text = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Screen")),
    );
  }
}
