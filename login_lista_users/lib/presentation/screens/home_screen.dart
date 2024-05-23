import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String username;
  HomeScreen({super.key, this.username = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', ),
      ),
      body: Center(
        child: Text('Welcome $username', style: const TextStyle(
          fontSize: 40,
           color: Color(0xFF155D94),
            fontWeight: FontWeight.w600),), 
      ),
    );
  }
}
