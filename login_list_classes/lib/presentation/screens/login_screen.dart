// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_ana/entities/users.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController passController = TextEditingController();
  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sign in ',
            style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 13, 76, 123),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: userController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF237FC6),
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xFF155D94),
                    width: 2.0,
                  ),
                ),
                hintText: 'Username',
                icon: const Icon(Icons.person_2_outlined),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              obscureText: true,
              controller: passController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF237FC6),
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xFF155D94),
                    width: 2.0,
                  ),
                ),
                hintText: 'Password',
                icon: const Icon(Icons.lock_clock_outlined),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundColor: const Color(0xFF237FC6), // text color
            ),
            onPressed: () {
              List<User> users = [
                User("Ana", "279"),
                User("Mili", "123"),
                User("AG", "135")
              ];
              String inputUser = userController.text;
              String inputPass = passController.text;

              if (users.isEmpty) {
                print('No users');
              }

              if (inputUser.isEmpty || inputPass.isEmpty) {
                SnackBar snackBar = const SnackBar(
                  content: Text('There are empty fields',
                      selectionColor: Color.fromARGB(255, 255, 255, 255)),
                  backgroundColor: Color.fromARGB(255, 42, 42, 42),
                  elevation: 10,
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.all(10),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                return;
              } else {
                int x = users.indexWhere ((User) => User.username == inputUser); //devuelve -1 si no se encuentra nada
                if (x != -1) {
                  if (inputPass == users[x].password) {
                    context.push('/games'); 
                  } else {
                    SnackBar snackBar = const SnackBar(
                      content: Text('Incorrect password',
                          selectionColor: Color.fromARGB(255, 255, 255, 255)),
                      backgroundColor: Color.fromARGB(255, 238, 54, 30),
                      elevation: 10,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      duration: Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  SnackBar snackBar = const SnackBar(
                    content: Text('Nonexistent user',
                        selectionColor: Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: Color(0xFFEE551E),
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            },
            child: const Text('Log in'),
          ),
        ],
      ),
    ));
  }
}
