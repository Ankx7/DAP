import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center( 
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Hello", style: TextStyle(fontSize: 40),), 
            Text("World", style: TextStyle(fontSize: 40),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text("Nombre: ", style: TextStyle(fontSize: 24),),
                Text("Ana", style: TextStyle(fontSize: 24),),
              ],
            )
          ],
        ),
       /* body: Center(
          child: Text("Hello World") ,
        ),*/
      ),
      )
    );
  }
}
