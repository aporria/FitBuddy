import 'package:flutter/material.dart';

class RoutineDetailsPage extends StatefulWidget {
  //FriendContactDetailsPage({Key? key}) : super(key: key);

  var routineDetails;

  RoutineDetailsPage(this.routineDetails, {Key? key}) : super(key: key);

  @override
  State<RoutineDetailsPage> createState() => _RoutineDetailsPageState();
}

class _RoutineDetailsPageState extends State<RoutineDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Text('${widget.routineDetails['name']}'),
            Text('${widget.routineDetails['category']}'),
          ],
        )
    );
  }
}