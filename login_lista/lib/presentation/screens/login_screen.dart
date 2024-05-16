import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController passController = TextEditingController();
  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: userController,
            decoration: const InputDecoration(
              hintText: 'Username',
              icon: Icon(Icons.person_2_outlined),
            ),
          ),
          TextField(
            obscureText: true, //puntos para el password
            controller: passController,
            decoration: const InputDecoration(
              hintText: 'Password',
              icon: Icon(Icons.lock_clock_outlined),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              List<String> users = ['Mia', 'Ana','Hola']; //List <tipo> nombre = [element1, element2, ....];
              List<int> passwords = [1414, 279, 123];
              String inputUser = userController.text;
              String inputPass = passController.text;
              if (inputUser.isEmpty || inputPass.isEmpty) {
                print("Vacio");
                return;
              }
              
              if (users.contains(inputUser)) {
                print("usuario existe");
                
                // ignore: unrelated_type_equality_checks
                if (inputPass == passwords [users.indexOf(inputUser)]) { //password coincide con user
                  context.push('/home',
                    extra: inputUser); //opcion 2 se apila, hace hijos
                  //context.go('/home'); //opcion 1 voy directo
              } else {
                print("Inicio de sesión fallido");
                SnackBar snackBar = SnackBar(
                  content: const Text('Login fallido'),
                  duration: const Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              } else {
                 print("Usuario no existe");
                SnackBar snackBar = SnackBar(
                  content: const Text('El usuario no existe'),
                  duration: const Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
