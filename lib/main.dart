import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift_sample/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();
  await database.into(database.todo).insert(
        TodoCompanion.insert(content: 'Buy milk'),
      );
  await database.into(database.todo).insert(
        TodoCompanion.insert(content: 'Buy eggs'),
      );
  await database.into(database.todo).insert(
        TodoCompanion.insert(
          content: 'Buy bread',
          completed: const Value(true),
        ),
      );

  runApp(
    const MaterialApp(
      home: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello, world!'),
      ),
    );
  }
}
