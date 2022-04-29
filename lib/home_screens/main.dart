import 'package:fit_buddy/authentication_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_buddy/firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      home: const SplashPage(title: 'FitBuddy'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'FitBuddy',
              style: TextStyle(
                fontSize: 48,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: const RouteSettings(name: '/login'),
                      builder: (context) => const LoginPage()),
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
