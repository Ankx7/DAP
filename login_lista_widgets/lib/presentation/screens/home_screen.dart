import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String username;
  HomeScreen({super.key, this.username = ''});

  @override
  Widget build(BuildContext context) {
    List<String> type = [
      'MOBA (Multiplayer Online Battle Arena)',
      'Puzzle',
      'Shooter FPS',
      'Battle Royale / Shooter',
      'Open-world RPG',
      'Action RPG',
      'Shooter / MOBA',
      ' Sports (soccer)',
      'Game creation platform',
      'Racing',
      'Sandbox / Building',
      'Party / Social Deduction'
    ];
    List<String> games = [
      'League Of Legends',
      'Candy Crush Saga',
      'Call Of Duty',
      'Fortnite',
      'Genshin Impact',
      'Honkai Impact',
      'Brawls Stars',
      'FIFA 23',
      'Roblox',
      'Asphalt 9: Legends',
      'Minecraft',
      'Among Us'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: ListView.builder(
        
        itemCount: games.length,
        itemBuilder: (context, index) {
          const EdgeInsets.all(8);
          return Card(
              child: ListTile(
            
            onTap: () {},
            tileColor: const Color.fromARGB(255, 42, 0, 110),
            title: Text(
              games[index],
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Text(type[index],
            style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 195, 196, 215),
                  fontWeight: FontWeight.w100),
            ),
          ));
        },
      ),
      /*Center(
        child: Text('Welcome $username', style: const TextStyle(
          fontSize: 40,
           color: Color(0xFF155D94),
            fontWeight: FontWeight.w600),), 
      ),*/
    );
  }
}
