//ana.gerli@gmail.com
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp_final_firebase/core/approuter.dart';
import 'firebase_options.dart';

Future<void> main() async {
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
   runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}