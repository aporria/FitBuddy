import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IndividualExerciseScreen extends StatefulWidget {
  const IndividualExerciseScreen({Key? key}) : super(key: key);

  @override
  State<IndividualExerciseScreen> createState() => _IndividualExerciseScreenState();
}

class _IndividualExerciseScreenState extends State<IndividualExerciseScreen> {

  var currentUser = FirebaseAuth.instance.currentUser;
  var userID = FirebaseAuth.instance.currentUser?.uid;
  var firebaseExerciseRoot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
    );
  }
}
