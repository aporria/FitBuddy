import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_buddy/home_screens/home.dart';
import 'package:fit_buddy/home_screens/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                'Sign in to FitBuddy',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
              width: 325,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: const BorderSide(color: Colors.red)
                        )
                    )
                ),
                child: const Text(
                  'Log in',
                ),
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text, password: passwordController.text)
                      .then((value) {
                        print('Login successful!');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                  }).catchError((error) {
                    print('Login unsuccessful.');
                    print(error.toString());
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Colors.red
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                    "Don't have an account?"
                ),
                SizedBox(
                  child: TextButton(
                    child: const Text(
                      'Sign up.',
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
