import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../exercise_set_screens/add_new_exercise.dart';

class ExerciseList extends StatefulWidget {
  const ExerciseList({Key? key}) : super(key: key);

  @override
  State<ExerciseList> createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {

  var exerciseList = [];
  var currentUser = FirebaseAuth.instance.currentUser;
  var userID = FirebaseAuth.instance.currentUser?.uid;

  _ExerciseListState() {
    refreshExerciseList();
    FirebaseDatabase.instance.ref().child(userID.toString() + '/exercise_list').onChildChanged.listen((event) {
      print('Data changed.');
      refreshExerciseList();
    });
    FirebaseDatabase.instance.ref().child(userID.toString()).onChildRemoved.listen((event) {
      print('Data changed.');
      setState(() {
        exerciseList.clear();
      });
      refreshExerciseList();
    });
    FirebaseDatabase.instance.ref().child(userID.toString() + '/exercise_list').onChildAdded.listen((event) {
      print('Data changed.');
      refreshExerciseList();
    });
  }

  void refreshExerciseList() {
    FirebaseDatabase.instance.ref().child(userID.toString() + '/exercise_list').orderByKey().once()
      .then((datasnapshot) {
        print('Successfully loaded the data!');
        if (currentUser != null) {
          print(currentUser?.uid);
        }
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
        });
        setState(() {

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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('FitBuddy'),
      ),
      backgroundColor: Colors.lightBlue.shade50,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 24.0,
            ),
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hello!",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Text(
                    "Welcome to FitBuddy! Add exercises and track your progress, "
                        "time yourself with the stopwatch, or if you're indecisive,"
                        " choose an exercise at random with the randomizer!",
                    style: TextStyle(
                        fontSize: 16.0,
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Column(
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
                        ),
                        Text(
                            '${exerciseList[index]['category']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
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
