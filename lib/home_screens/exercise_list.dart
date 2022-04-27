import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:fit_buddy/exercise_set_screens/add_new_routine.dart';
import 'package:fit_buddy/exercise_set_screens/routine_details.dart';
import 'package:flutter/material.dart';

import '../exercise_set_screens/add_new_exercise.dart';

class ExerciseList extends StatefulWidget {
  const ExerciseList({Key? key}) : super(key: key);

  @override
  State<ExerciseList> createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {

  var exerciseList = [];

  _ExerciseListState() {
    refreshExerciseList();
    FirebaseDatabase.instance.ref().child('exercises').onChildChanged.listen((event) {
      print('Data changed.');
      refreshExerciseList();
    });
    FirebaseDatabase.instance.ref().child('exercises').onChildRemoved.listen((event) {
      print('Data changed.');
      refreshExerciseList();
    });
    FirebaseDatabase.instance.ref().child('exercises').onChildAdded.listen((event) {
      print('Data changed.');
      refreshExerciseList();
    });
  }

  void refreshExerciseList() {
    FirebaseDatabase.instance.ref().child('exercises').once()
      .then((datasnapshot) {
        print('Successfully loaded the data!');
        print(datasnapshot);
        print('Key: ' + datasnapshot.snapshot.key.toString());
        print(datasnapshot.snapshot.key);
        print("Value: " + datasnapshot.snapshot.value.toString());
        print(datasnapshot.snapshot.value);
        print("Iterating the value map: ");
        Map<dynamic, dynamic> data = jsonDecode(jsonEncode(datasnapshot.snapshot.value));
        data.cast<String, dynamic>();
        var exerciseListTmp = [];
        data.forEach((key, value) {
          print(key);
          print(value);
          exerciseListTmp.add(value);
          exerciseList = exerciseListTmp;
          setState(() {

          });
        });
        print("Final Exercise List: ");
        print(exerciseListTmp);
      }).catchError((error) {
        print("Failed to load data!");
        print(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FitBuddy'),
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            //margin: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 24.0,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hello!",
                  style: TextStyle(
                    color: Color(0xFF211551),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    "Welcome to FitBuddy! Add exercises and track your progress!",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF86829D),
                        height: 1.5
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exerciseList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    print("The item is clicked");

                  },
                  title: Container(
                    width: double.infinity,
                    //margin: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                    padding: const EdgeInsets.symmetric(
                      vertical: 32.0,
                      horizontal: 24.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${exerciseList[index]['name']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                    '${exerciseList[index]['numSets']} sets • ',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                    '${exerciseList[index]['numReps']} reps',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                            '${exerciseList[index]['category']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ]
                    ),
                  ),
                );
              }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewExercise()),
          );
        },
        child: const Icon(Icons.add_rounded),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)
        ),
      ),
    );
  }
}
