import 'package:flutter/material.dart';
import 'package:login_ana/core/app_router.dart';
import 'package:login_ana/presentation/screens/login_screen.dart';


void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}