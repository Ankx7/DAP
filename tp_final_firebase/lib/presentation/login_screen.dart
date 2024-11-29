// ignore_for_file: avoid_print, use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
            'Log in ',
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
              backgroundColor: const Color(0xFF237FC6),
            ),
            onPressed: () async {
              String inputEmail = emailController.text.trim();
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
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: inputEmail, password: inputPass);
                context.push('/home');
              } on FirebaseAuthException catch (e) {
                print('Error code: ${e.code}');
                String mensaje;
                switch (e.code) {
                  case 'invalid-credential':
                    mensaje = 'Wrong password or user';
                    break;
                  case 'invalid-email':
                    mensaje = 'Invalid email.';
                    break;
                  default:
                    mensaje = 'An error occurred. Try again.';
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      mensaje,
                      selectionColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    backgroundColor: const Color.fromARGB(255, 26, 27, 49),
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.all(10),
                    duration: const Duration(seconds: 1),
                  ),
                );
              }
            },
            child: const Text('Log in'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundColor: const Color(0xFF237FC6),
            ),
            onPressed: () {
              context.push('/signup');
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    ));
  }
}
