// ignore_for_file: empty_catches

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tp_final_firebase/domain/games.dart';

final gamesProvider = StateNotifierProvider<GamesNotifier, List<Game>>(
  (ref) => GamesNotifier(FirebaseFirestore.instance),
);

class GamesNotifier extends StateNotifier<List<Game>> {
  final FirebaseFirestore db;
  GamesNotifier(this.db) : super([]);

  CollectionReference<Game> get _gamesCollection => db //obtiene datos firebase
      .collection('games')
      .withConverter(
        fromFirestore: Game.fromFS,
        toFirestore: (Game game, _) => game.toFS(),
      );

  Future<void> addGame(Game game) async {
    try {
      final doc = _gamesCollection.doc(game.id); // usa el id del Game
      await doc.set(game); //almacena todo el objeto
      state = [...state, game]; //actualiza
    } catch (e) {}
  }

  Future<void> getGames() async {
    try {
      final querySnapshot = await _gamesCollection.get();
      final games = querySnapshot.docs.map((doc) => doc.data()).toList();
      state = games; //remplaza estado, apra evitar duplicads
    } catch (e) {}
  }

  Future<void> deleteGame(String id) async {
    try {
      await _gamesCollection.doc(id).delete();
      state = state.where((game) => game.id != id).toList(); // actualiza estado
    } catch (e) {}
  }
  Future<void> updateGame(Game updatedGame) async {
    try {
      await _gamesCollection.doc(updatedGame.id).set(updatedGame);
      state = [
        for (final game in state)
          if (game.id == updatedGame.id) updatedGame else game
      ];
    } catch (e) {}
  }
}
