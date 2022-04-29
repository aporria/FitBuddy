import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {

  var currentUser = FirebaseAuth.instance.currentUser;
  var userID = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 35),
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  clearEntries(context);
                },
                child: const Text(
                  'Clear All Entries',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 10),
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  signOut();
                },
                child: const Text(
                    'Sign Out',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> clearEntries(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
            child: CircularProgressIndicator()
        )
    );
    try {
      await FirebaseDatabase.instance.ref().child(userID.toString() + '/exercise_list').remove()
          .then((datasnapshot) {

          }
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'All entries cleared'
          ),
        ),
      );
      Navigator.of(context).pop();
      setState(() {

      });
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              e.message.toString()
          ),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  Future signOut() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
            child: CircularProgressIndicator()
        )
    );
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Signed out'
          ),
        ),
      );
      Navigator.of(context).popUntil(
          ModalRoute.withName('/login')
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              e.message.toString()
          ),
        ),
      );
      Navigator.of(context).pop();
    }
  }
}
