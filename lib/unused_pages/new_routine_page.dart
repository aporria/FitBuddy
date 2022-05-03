import 'package:fit_buddy/exercise_set_screens/add_new_exercise.dart';
import 'package:flutter/material.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({Key? key}) : super(key: key);

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Exercise Routine'),
      ),
      floatingActionButton: SizedBox(
        width: 250,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNewExercise()),
            );
          },
          icon: const Icon(
              Icons.add_rounded,
            size: 30,
          ),
          label: const Text(
            'Add Exercise',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}