// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_final_firebase/domain/games.dart';
import 'package:tp_final_firebase/core/providers.dart';

class EditGameScreen extends ConsumerWidget {
  static const String name = 'edit_game_screen';

  final String gameId;

  const EditGameScreen({super.key, required this.gameId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final games = ref.watch(gamesProvider);

    final Game game = games.firstWhere(
      (game) => game.id == gameId,
      orElse: () => Game(id: '', name: '', type: '', imageUrl: ''),
    );
    final nameController = TextEditingController(text: game.name);
    final typeController = TextEditingController(text: game.type);
    final imageController = TextEditingController(text: game.imageUrl);

    Future<void> saveGame() async {
      final updatedGame = Game(
        id: game.id,
        name: nameController.text,
        type: typeController.text,
        imageUrl: imageController.text,
      );

      if (game.id.isEmpty) {
        ref.read(gamesProvider.notifier).addGame(updatedGame);
      } else {
        ref.read(gamesProvider.notifier).updateGame(updatedGame);
      }
      await ref
          .read(gamesProvider.notifier)
          .getGames(); // To refresh the game list after saving
      context.go('/home');
    }

    void deleteGame() {
      if (game.id.isNotEmpty) {
        ref.read(gamesProvider.notifier).deleteGame(game.id);
      }
      context.go('/home');
    }

    void cancelEdit() {
      context.go('/home');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(game.id.isEmpty ? 'Add Game' : 'Edit Game'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: game.imageUrl.isNotEmpty
                  ? Image.network(
                      game.imageUrl,
                      fit: BoxFit.cover,
                      height: double
                          .infinity, //para q cubra todo el flex (q es 1/3 pantalla)
                      width: double.infinity,
                    )
                  : const SizedBox(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 186, 224, 255),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 93, 158, 207),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: typeController,
                    decoration: InputDecoration(
                      hintText: 'Type',
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 203, 228, 249),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 93, 158, 207),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: imageController,
                    decoration: InputDecoration(
                      hintText: 'Image URL',
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 203, 228, 249),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 93, 158, 207),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (game.id.isNotEmpty)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor:
                              const Color(0xFF237FC6),
                        ),
                          onPressed: deleteGame,
                          child: const Text('Delete'),
                        ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor:
                              const Color(0xFF237FC6),
                        ),
                        onPressed: saveGame,
                        child: Text(game.id.isEmpty ? 'Add' : 'Save'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor:
                              const Color(0xFF237FC6),
                        ),
                        onPressed: cancelEdit,
                        child: const Text('Cancel',),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
