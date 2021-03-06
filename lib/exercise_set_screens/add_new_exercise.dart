import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewExercise extends StatefulWidget {
  const AddNewExercise({Key? key}) : super(key: key);

  @override
  State<AddNewExercise> createState() => _AddNewExerciseState();
}

class _AddNewExerciseState extends State<AddNewExercise> {

  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var numberOfSetsController = TextEditingController();
  var categoryController = TextEditingController();
  var numberOfRepsController = TextEditingController();

  var currentUser = FirebaseAuth.instance.currentUser;
  var userID = FirebaseAuth.instance.currentUser?.uid;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Exercise'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                    child: TextFormField(
                      controller: nameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        labelText: 'Name of exercise',
                        hintText: 'What do you want to call this exercise?'
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                    child: TextFormField(
                      controller: categoryController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        labelText: 'Category',
                        hintText: '(e.g., legs, chest, back, etc.)'
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a category';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                    child: TextFormField(
                      controller: numberOfSetsController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        labelText: 'Number of sets',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                    child: TextFormField(
                      controller: numberOfRepsController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        labelText: 'Number of reps',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print(nameController.text);
              print(categoryController.text);
              print(numberOfSetsController.text);
              print(numberOfRepsController.text);

              var timeStamp = DateTime.now().millisecondsSinceEpoch;
              FirebaseDatabase.instance.ref().child(userID.toString() + '/exercise_list/exercise' + timeStamp.toString()).set(
                {
                  "name" : nameController.text.trim(),
                  "category" : categoryController.text.trim(),
                  "numSets" : numberOfSetsController.text.trim(),
                  "numReps" : numberOfRepsController.text.trim(),
                  "uid" : getUID(),
                }
              ).then((value) {
                print("Successfully added new exercise!");
              }).catchError((error) {
                print("Failed to add character" + error.toString());
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Successfully added new exercise!'
                  ),
                ),
              );
              Navigator.pop(context);
            }
          },
          label: Row(
            children: const [
              Text('Confirm'),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.thumb_up_rounded,
                size: 24.0,
              ),
            ],
          ),
          icon: Container(),
        ),
      ),
    );
  }
  String getUID() {
    var timeStamp = DateTime.now().millisecondsSinceEpoch;
    var uid = ('exercise' + timeStamp.toString());
    return uid;
  }
  String getName() {
    return nameController.text;
  }
}