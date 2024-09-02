import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_listview/core/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(namesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Names'),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final name = names[index];
          return ListTile(
            title: Text(name),
            onTap: () {
              context.push('/edit_name/$name'); // Pass the name for editing
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/edit_name'); // Navigate to add a new name
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Name',
      ),
    );
  }
}
