import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  dynamic game;
  DetailsScreen({super.key, this.game = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Details',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 16, 68),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(width: 400, height: 400, child: Image.network(game.image)),
              Text(
                game.name,
                style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 236, 207, 246),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                game.description,
                style: const TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 132, 99, 163),
                    fontWeight: FontWeight.w300),
              )
            ])));
  }
}
