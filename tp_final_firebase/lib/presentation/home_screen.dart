import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_final_firebase/core/providers.dart';
import 'package:tp_final_firebase/domain/games.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'games_screen';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(gamesProvider.notifier).getGames();
  }

  @override
  Widget build(BuildContext context) {
    List<Game> games = ref.watch(gamesProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Games'),
        ),
        body: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return Card(
                color: const Color.fromARGB(255, 15, 56, 96),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(width: 1, color:  Color.fromARGB(255, 15, 56, 96),)
                ),
                margin: const EdgeInsets.all(3),
                child: ListTile(
                  leading: game.imageUrl.isNotEmpty //if
                      ? ClipRRect(
                          //si verdadero
                          borderRadius: BorderRadius.circular(2),
                          child: Image.network(
                            game.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const SizedBox(
                          //si falso
                          width: 50,
                          height: 50,
                        ),
                  title: Text(
                    game.name,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    game.type,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 180, 199, 239),
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: const Icon(
                    Icons.arrow_right_alt_rounded,
                    size: 50,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onTap: () {
                    context.go('/edit_game/${game.id}');
                  },
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newGame = Game(
              id: DateTime.now()
                  .millisecondsSinceEpoch
                  .toString(), //genera id unico
              name: '',
              type: '',
              imageUrl: '',
            );
            await ref.read(gamesProvider.notifier).addGame(newGame);
          },
          child: const Icon(Icons.add),
        ));
  }
}