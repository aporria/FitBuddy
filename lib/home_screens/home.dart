import 'package:flutter/material.dart';
import '../new_set.dart';
import '../existing_set.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewSet(title: 'New Routine',)),
                  );
                },
                child: const Text(
                    'Create New Routine',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExistingSets(title: 'Existing Routines',)),
                  );
                },
                child: const Text(
                    'Choose Existing Routine',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}