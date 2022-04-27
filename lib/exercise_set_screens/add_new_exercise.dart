import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddNewExercise extends StatefulWidget {
  const AddNewExercise({Key? key}) : super(key: key);

  @override
  State<AddNewExercise> createState() => _AddNewExerciseState();
}

class _AddNewExerciseState extends State<AddNewExercise> {

  var nameController = TextEditingController();
  var numberOfSetsController = TextEditingController();
  var categoryController = TextEditingController();
  var numberOfRepsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Exercise'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name of exercise',
              ),
            ),
            TextField(
              controller: categoryController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Category',
              ),
            ),
            TextField(
              controller: numberOfSetsController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of sets',
              ),
            ),
            TextField(
              controller: numberOfRepsController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of reps',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print(nameController.text);
          print(categoryController.text);
          print(numberOfSetsController.text);
          print(numberOfRepsController.text);

          var timeStamp = DateTime.now().millisecondsSinceEpoch;
          FirebaseDatabase.instance.ref().child('exercises/exercise' + timeStamp.toString()).set(
            {
              "name" : nameController.text,
              "category" : categoryController.text,
              "numSets" : numberOfSetsController.text,
              "numReps" : numberOfRepsController.text,
            }
          ).then((value) {
            print("Successfully added new exercise!");
          }).catchError((error) {
            print("Failed to add character" + error.toString());
          });
          Navigator.pop(context);
        },
        label: const Text('Finish'),
        icon: const Icon(
            Icons.thumb_up_rounded
        ),
      ),
    );
  }
}