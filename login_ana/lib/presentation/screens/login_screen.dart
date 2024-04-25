import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_ana/presentation/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  TextEditingController passController = TextEditingController() ;
  TextEditingController userController = TextEditingController() ;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column (
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
              onPressed: (){
                String inputUser = userController.text;
                String inputPass = passController.text;
                if (inputUser.isEmpty && inputPass.isEmpty) {
                  print("Vacio");
                  return;
                }
                if ((inputUser == "Ana") && (inputPass == "123") ){
                  print("Inicio de sesión exitoso");
                  //context.go('/home'); //opcion 1 voy directo
                  context.push('/home', extra: userController.text);//opcion 2 se apila, hace hijos
                }
                else{
                  print("Inicio de sesión fallido");
                }
                }, 
              
              child: const Text('Login'), 

            ),
        ],),
      );
  }
}