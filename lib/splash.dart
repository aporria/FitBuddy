import 'package:flutter/material.dart';
import 'home.dart';

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
      home: const SplashPage(title: 'Splash'),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
            Text(
              'FitBuddy',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage(title: 'Home',)),
                  );
                },
                child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
