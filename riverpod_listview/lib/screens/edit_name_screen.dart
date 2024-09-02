import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_listview/core/providers.dart';

class EditNameScreen extends ConsumerWidget {
  const EditNameScreen({super.key, this.name = ''});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController(text: name);

    void acceptName() {
      final newName = nameController.text;
      if (name.isEmpty) {
        // Adding a new name
        ref.read(namesProvider.notifier).addName(newName);
      } else {
        // Editing an existing name
        ref.read(namesProvider.notifier).updateName(name, newName);
      }
      context.go('/home');
    }

    void deleteName() {
      if (name.isNotEmpty) {
        ref.read(namesProvider.notifier).removeName(name);
      }
      context.go('/home');
    }

    void cancelEdit() {
      context.go('/home');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(name.isEmpty ? 'Add Name' : 'Edit Name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 110, 89, 76),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 57, 48, 38),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (name.isNotEmpty)
                  ElevatedButton(
                    onPressed: deleteName,
                    child: Text('Delete'),
                  ),
                ElevatedButton(
                  onPressed: acceptName,
                  child: Text(name.isEmpty ? 'Add' : 'Accept'),
                ),
                ElevatedButton(
                  onPressed: cancelEdit,
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
