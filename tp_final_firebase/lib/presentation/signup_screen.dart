// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool validEmail(String email) {
    final emailEx = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); //eso es un regex,  seriá lo que indica que valores son validos
    return emailEx.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sign Up ',
            style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 13, 76, 123),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 400,
            child: TextField(
              controller: emailController,
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
                hintText: 'Email',
                icon: const Icon(Icons.person_2_outlined),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 400,
            child: TextField(
              obscureText: true, //puntos para el password
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
            onPressed: () async {
              String inputEmail = emailController.text
                  .trim(); //trim para sacar espacios inecesarios
              String inputPass = passController.text.trim();
              if (!validEmail(inputEmail)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Invalid email',
                      selectionColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                    backgroundColor: Color.fromARGB(255, 26, 27, 49),
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10),
                    duration: Duration(seconds: 1),
                  ),
                );
                return;
              }
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: inputEmail,
                  password: inputPass,
                );
                context.push('/login');
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('Weak password');
                  SnackBar snackBar = const SnackBar(
                    content: Text('Weak password',
                        selectionColor: Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: Color.fromARGB(255, 42, 42, 42),
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (e.code == 'email-already-in-use') {
                  print('Email already in use');
                  SnackBar snackBar = const SnackBar(
                    content: Text('Email already in use',
                        selectionColor: Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: Color.fromARGB(255, 42, 42, 42),
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } catch (e) {
                print(e);
                return;
              }
            },
            child: const Text('Sign Up'),
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
              context.push('/login');
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    ));
  }
}
