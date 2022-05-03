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

  final upperBodyExercises = [
    'Flat bench press',
    'Incline bench press',
    'Decline bench press',
    'Chest fly',
    'Pushup',
    'Pulldown',
    'Pullup',
    'Chinup',
    'Cable crossovers',
    'Dips',
    'Bent-over row',
    'Upright row',
    'Shoulder press',
    'Military press',
    'Lateral raise',
    'Pushdown',
    'Tricep extension',
    'Preacher curl',
    'Barbell curl'
  ];
  final lowerBodyExercises = [
    'Squat',
    'Front squat',
    'Leg press',
    'Leg extension',
    'Wall sit',
    'Deadlift',
    'Stiff-legged deadlift',
    'Leg curl',
    'Snatch',
    'Standing calf raise',
    'Seated calf raise',
    'Hip adductor'
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
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
                    "Random Exercise Generator",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                    ),
                    child: Text(
                      'Choose a category below and a random exercise from that '
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
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 10),
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  exercise = upperBodyExercises[_random.nextInt(upperBodyExercises.length)];
                  setState(() {

                  });
                },
                child: const Text(
                  'Upper Body',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 20),
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  exercise = lowerBodyExercises[_random.nextInt(lowerBodyExercises.length)];
                  setState(() {

                  });
                },
                child: const Text(
                  'Lower Body',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 20),
              width: 200,
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    exercise,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
