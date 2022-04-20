import 'package:fit_buddy/home_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: const Text(
              'Sign up to FitBuddy',
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
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.red)
                      )
                  )
              ),
              child: const Text(
                'Confirm',
              ),
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text, password: passwordController.text)
                    .then((value) {
                      print('Successfully signed up!');
                      Navigator.pop(context);
                }).catchError((error) {
                  print('Failed to sign up.');
                  print(error.toString());
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
