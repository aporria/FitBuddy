import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_buddy/authentication_screens/forgot_password_page.dart';
import 'package:fit_buddy/home_screens/exercise_list.dart';
import 'package:fit_buddy/authentication_screens/signup.dart';
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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
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
                          )
                      )
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Log in'), // <-- Text
                      SizedBox(
                        width: 5,
                      ),
                      Icon( // <-- Icon
                        Icons.login_rounded,
                        size: 24.0,
                      ),
                    ],
                  ),
                  onPressed: () {
                    login();
                  },
                ),
              ),
              GestureDetector(
                child: SizedBox(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                      );
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
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
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Login successful!'
          ),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ExerciseList()),
      );
      print('Login successful!');
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              e.message.toString()
          ),
        ),
      );
      Navigator.of(context).popUntil(
          ModalRoute.withName('/login')
      );
    }
  }
}
