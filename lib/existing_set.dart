import 'package:fit_buddy/start_set.dart';
import 'package:flutter/material.dart';
import 'edit_set.dart';

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
      home: const ExistingSets(title: 'Existing Sets'),
    );
  }
}

class ExistingSets extends StatefulWidget {
  const ExistingSets({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ExistingSets> createState() => _ExistingSetsState();
}

class _ExistingSetsState extends State<ExistingSets> {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartSetOne(title: 'Set 1',)),
                );
              },
              child: const Text('placeholder'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartSetOne(title: 'Set 1',)),
                );
              },
              child: const Text('placeholder'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartSetOne(title: 'Set 1',)),
                );
              },
              child: const Text('placeholder'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartSetOne(title: 'Set 1',)),
                );
              },
              child: const Text('placeholder'),
            ),
          ],
        ),
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