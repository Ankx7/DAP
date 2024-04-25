import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String username;
  HomeScreen({super.key, this.username = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Welcome $username'),
      ),
    );
  }
}
