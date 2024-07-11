import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_ana/entities/game.dart';

// ignore: must_be_immutable
class GamesScreen extends StatelessWidget {
  GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Game> games = [
      Game('League Of Legends', 'MOBA (Multiplayer Online Battle Arena)',
         'https://img.redbull.com/images/c_fill,w_1200,h_600,g_auto,f_auto,q_auto/redbullcom/2022/8/1/ksfga6rlx2ugfhjd9vnk/league-of-legends',
         'League of Legends es un juego MOBA donde dos equipos compiten por destruir la base del otro. Cada jugador elige un campeón con habilidades únicas y estrategias diferentes.'),
    Game('Candy Crush Saga', 'Puzzle',
         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrEKyRQeyperPiEhmMMCy-MdPuxScQYzXcbg&s',
         'Candy Crush Saga es un juego de puzzle adictivo donde los jugadores combinan caramelos para resolver niveles y alcanzar objetivos específicos.'),
    Game('Call Of Duty', 'Shooter FPS',
         'https://image.api.playstation.com/vulcan/ap/rnd/202306/2400/ac505d57a46e24dd96712263d89a150cb443af288c025ff2.jpg',
         'Call of Duty es un shooter en primera persona donde los jugadores participan en intensas batallas militares en diversos escenarios.'),
    Game('Fortnite', 'Battle Royale / Shooter',
         'https://store-images.s-microsoft.com/image/apps.61483.70702278257994163.1152c6f1-f586-40eb-a61e-0f8bad1ee621.dac35347-06f6-4003-88b5-931747a876cf?q=90&w=177&h=265',
         'Fortnite es un juego de Battle Royale donde los jugadores luchan para ser el último en pie utilizando habilidades de construcción y combate.'),
    Game('Genshin Impact', 'Open-world RPG',
         'https://image.api.playstation.com/vulcan/img/rnd/202104/2507/Xdncb153Sz5UZMaF0X944NP5.png',
         'Genshin Impact es un RPG de mundo abierto con un sistema de combate basado en habilidades y exploración de vastos paisajes.'),
    Game('Honkai Starrail', 'RPG de estrategia',
         'https://image.api.playstation.com/vulcan/ap/rnd/202308/1103/8c3ce3611a4bb187418bb5e24924a055ba33d3046a7aaacb.png',
         'Honkai Starrail es un RPG estratégico donde los jugadores forman equipos y luchan en batallas tácticas.'),
    Game('Brawl Stars', 'Shooter / MOBA',
         'https://supercell.com/images/e93a34598d3723641a72eb9ce02691f6/games_thumbnail_brawlstars.5cd76330.jpg',
         'Brawl Stars es un juego que combina elementos de shooter y MOBA, donde los jugadores se enfrentan en equipos y compiten por objetivos.'),
    Game('FIFA 23', 'Sports (soccer)',
         'https://media.vandal.net/m/122945/fifa-23-202210612192557_1.jpg',
         'FIFA 23 es un simulador de fútbol que ofrece una experiencia realista de juego, con licencias de equipos y jugadores de todo el mundo.'),
    Game('Roblox', 'Game creation platform',
         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8BmqR8FlCyymP4F-4j1326TejJyKWTY_ecA&s',
         'Roblox es una plataforma de creación de juegos donde los usuarios pueden diseñar, compartir y jugar experiencias creadas por otros jugadores.'),
    Game('Asphalt 9: Legends', 'Racing',
         'https://i.ytimg.com/vi/veCXXRBcTBQ/maxresdefault.jpg',
         'Asphalt 9: Legends es un juego de carreras arcade con gráficos impresionantes y una amplia variedad de coches y pistas.'),
    Game('Minecraft', 'Sandbox / Building',
         'https://image.api.playstation.com/vulcan/img/cfn/11307LYz6S9drBQ5DxqTtXpJgrkBd8LHrVniA1iLxMC-nnMIoGeN3lBQpSk4dk2g_B5ASg_CHvdu1oyRnnbprGtq8lAJolcw.png',
         'Minecraft es un juego sandbox donde los jugadores pueden construir estructuras, explorar mundos generados proceduralmente y enfrentarse a desafíos.'),
    Game('Among Us', 'Party / Social Deduction',
         'https://cdn1.idcgames.com/storage/image/1333/thumb_slider/default.jpg',
         'Among Us es un juego de deducción social donde los jugadores deben descubrir al impostor entre ellos mientras realizan tareas y discuten sus sospechas.'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Games',
        ),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          const EdgeInsets.all(30);
          return Card(
              child: ListTile(
            onTap: () {
              context.push('/details', extra: games[index]);
            },
            leading: Container(
              width: 80,
              height: 40,
              child: Image.network(games[index].image, fit: BoxFit.cover,),
            ),
            tileColor: const Color.fromARGB(255, 43, 16, 68),
            title: Text(
              games[index].name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 232, 195, 244),
                  fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              games[index].type,
              style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 123, 83, 161),
                  fontWeight: FontWeight.w300),
            ),
          ));
        },
      ),
    );
  }
}