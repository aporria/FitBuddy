import 'package:flutter/material.dart';

class StartSetOne extends StatefulWidget {
  const StartSetOne({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StartSetOne> createState() => _StartSetOneState();
}

class _StartSetOneState extends State<StartSetOne> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          Text('Title 1'),
          Text('Title 2'),
          SizedBox(
            child: Text('00.00s'),
          ),
          Text('Title 3'),
        ],
      ),
    );
  }
}