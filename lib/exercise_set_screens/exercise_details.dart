import 'package:flutter/material.dart';

class ExerciseDetailsPage extends StatefulWidget {
  //FriendContactDetailsPage({Key? key}) : super(key: key);

  var exerciseDetails;

  ExerciseDetailsPage(this.exerciseDetails, {Key? key}) : super(key: key);

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Text('${widget.exerciseDetails['name']}'),
            Text('${widget.exerciseDetails['number']}'),
            Text('${widget.exerciseDetails['time']}'),
            Text('${widget.exerciseDetails['category']}'),
          ],
        )
    );
  }
}