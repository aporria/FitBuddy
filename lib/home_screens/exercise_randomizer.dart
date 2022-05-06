import 'package:flutter/material.dart';
import 'dart:math';

class Randomizer extends StatefulWidget {
  const Randomizer({Key? key}) : super(key: key);

  @override
  State<Randomizer> createState() => _RandomizerState();
}

class _RandomizerState extends State<Randomizer> {
  var exercise = '';
  final _random = Random();

  final chestExercises = [
    'Flat bench press',
    'Incline bench press',
    'Decline bench press',
    'Chest fly',
    'Pushup',
    'Cable crossovers',
    'Vertical dips',
    'Cable fly'
  ];

  final backExercises = [
    'Lat pulldown',
    'Pullup',
    'Chinup',
    'Bent-over row',
    'Rows',
    'Deadlift',
  ];

  final shoulderExercises = [
    'Shoulder press',
    'Military press',
    'Lateral raise',
    'Front raise'
  ];

  final legExercises = [
    'Squat',
    'Front squat',
    'Leg press',
    'Leg extension',
    'Wall sit',
    'Stiff-legged deadlift',
    'Leg curl',
    'Standing calf raise',
    'Seated calf raise',
    'Hip adductor'
  ];

  final bicepExercises = [
    'Barbell curl',
    'Preacher curl',
    'Dumbell curl',
    'Hammer curl',
    'Alternating curl'
  ];

  final tricepExercises = [
    'Pushdown',
    'Dips',
    'Tricep extension',
    'Diamond pushups',
    'Close-grip bench press'
  ];

  final waistExercises = [
    'Crunches',
    'Leg raise',
    'Russian twists',
    'Planks',
    'Mountain climbers',
    'Reverse crunches',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text('FitBuddy'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            //margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 24.0,
            ),
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Exercise Randomizer!",
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
                    'Scroll and choose a category below and a random exercise from that '
                        'category will be generated!',
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
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = chestExercises[_random.nextInt(chestExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Chest',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = legExercises[_random.nextInt(legExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Legs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = backExercises[_random.nextInt(backExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = shoulderExercises[_random.nextInt(shoulderExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Shoulders',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = bicepExercises[_random.nextInt(bicepExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Biceps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = tricepExercises[_random.nextInt(tricepExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Triceps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = waistExercises[_random.nextInt(waistExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Waist',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                exercise,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /*
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, top: 10),
                      height: 75,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          exercise = chestExercises[_random.nextInt(chestExercises.length)];
                          setState(() {

                          });
                        },
                        child: const Text(
                          'Chest',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 30, top: 10),
                      height: 75,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          exercise = legExercises[_random.nextInt(legExercises.length)];
                          setState(() {

                          });
                        },
                        child: const Text(
                          'Legs',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 30, top: 20),
                  height: 75,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = shoulderExercises[_random.nextInt(shoulderExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Shoulders',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 30, top: 20),
                  height: 75,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = backExercises[_random.nextInt(backExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 30, top: 20),
                  height: 75,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = bicepExercises[_random.nextInt(bicepExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Biceps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 30, top: 20),
                  height: 75,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      exercise = tricepExercises[_random.nextInt(tricepExercises.length)];
                      setState(() {

                      });
                    },
                    child: const Text(
                      'Triceps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 75,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  exercise = waistExercises[_random.nextInt(waistExercises.length)];
                  setState(() {

                  });
                },
                child: const Text(
                  'Waist',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          FittedBox(
            child: Text(
              'test',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          */

        ],
      ),
    );
  }
}
