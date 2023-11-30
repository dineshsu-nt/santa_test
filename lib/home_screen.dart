import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:santa_test/add_child_screen.dart';
import 'package:santa_test/children_notifier.dart';
import 'package:santa_test/model/user_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final List<Child> children = ref.watch(childrenProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Santa Christmas List'),
      ),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) {
          final child = children[index];
          return Card(
            child: ListTile(
              tileColor: Colors.orangeAccent,
              title: Text(
                child.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                child.country,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              trailing: TextButton(
                onPressed: () {
                  // Change isNice status when the text button is pressed
                  final bool newIsNice = !child.isNice;
                  ref
                      .read(childrenProvider.notifier)
                      .updateNiceStatus(child, newIsNice);
                },
                child: Text(
                  child.isNice ? 'Nice' : 'Naughty',
                  style: TextStyle(
                    color: child.isNice ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddChildScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
