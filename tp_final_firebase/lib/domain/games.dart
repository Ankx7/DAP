import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  final String id;
  final String name;
  final String type;
  final String imageUrl;

  Game ({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
  });

  Map<String, dynamic> toFS() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
    };
  }

  static Game fromFS(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return Game(
      id: data?['id'],
      name: data?['name'],
      type: data?['type'], 
      imageUrl: data?['imageUrl'],
    );
  }
}