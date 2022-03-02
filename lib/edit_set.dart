import 'package:fit_buddy/existing_set.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitBuddy',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const EditSet(title: 'Edit Set'),
    );
  }
}

class EditSet extends StatefulWidget {
  const EditSet({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EditSet> createState() => _EditSetState();
}

class _EditSetState extends State<EditSet> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: style,
              onPressed: () {
                //todo code
              },
              child: const Text('Name of set'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                //todo code
              },
              child: const Text('Number of sets'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                //todo code
              },
              child: const Text('Time for each set'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                //todo code
              },
              child: const Text('Time between sets'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ExistingSets(title: 'Existing Set')),
          );
        },
        child: const Text('Finish')
      ),
    );
  }
}