import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'new_routine_page.dart';

class AddNewRoutine extends StatefulWidget {
  const AddNewRoutine({Key? key}) : super(key: key);

  @override
  State<AddNewRoutine> createState() => _AddNewRoutineState();
}

class _AddNewRoutineState extends State<AddNewRoutine> {

  var nameController = TextEditingController();
  var categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Routine'),
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
                labelText: 'Name of routine',
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print(nameController.text);
          print(categoryController.text);

          FirebaseDatabase.instance.ref().child('routine 1/exercise 1').set(
            {
              "name" : nameController.text,
              "category" : categoryController.text,
            }
          ).then((value) {
            print("Successfully added new routine!");
          }).catchError((error) {
            print("Failed to add character" + error.toString());
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewRoutine()),
          );
        },
        label: const Text('Continue'),
        icon: const Icon(
            Icons.arrow_forward_ios_rounded
        ),
      ),
    );
  }
}