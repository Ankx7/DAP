import 'package:flutter/material.dart';
import 'package:login_ana/core/app_router.dart';

void main() {
  runApp(MainApp());

/* ------ EJEMPLO CLASE ----------
 List<String> users = [
    'Ale',
    'Juan',
    'Ana'
  ]; //List <tipo> nombre = [element1, element2, ....];
  List<int> passwords = [123, 456, 279];

//List <dynamic> es para cualquier tipo de varible, pero no es recomendable.
  users.add('ORT');
  passwords.add(2024);

  print(users);
  print(users[2]);

  users.forEach((item) {
    if (item == 'Ana') {
      print("$item encontrado");
      return;
    } else {
      print("Ana no encontrado");
    }
  } 
  );
  if (users.isEmpty) {
    print('No users');
  }

  bool isAna = users.contains('Ana');
  print(isAna);
  */
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}
