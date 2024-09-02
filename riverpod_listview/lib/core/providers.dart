import 'package:flutter_riverpod/flutter_riverpod.dart';

final namesProvider = StateNotifierProvider<NamesNotifier, List<String>>((ref) {
  return NamesNotifier();
});

class NamesNotifier extends StateNotifier<List<String>> {
  NamesNotifier() : super(['Ana', 'Mili', 'Laura', 'Diego']);

  void addName(String name) {
    if (name.isNotEmpty && !state.contains(name)) {
      state = [...state, name];
    }
  }

  void updateName(String oldName, String newName) {
    if (newName.isNotEmpty && state.contains(oldName)) {
      final newState = state.map((name) => name == oldName ? newName : name).toList();
      state = newState;
    }
  }

  void removeName(String name) {
    if (state.contains(name)) {
      state = state.where((n) => n != name).toList();
    }
  }
}
