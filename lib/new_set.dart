import 'package:fit_buddy/edit_set.dart';
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
      home: const NewSet(title: 'New Set'),
    );
  }
}

class NewSet extends StatefulWidget {
  const NewSet({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NewSet> createState() => _NewSetState();
}

class _NewSetState extends State<NewSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditSet(title: 'Edit New Set',)),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}