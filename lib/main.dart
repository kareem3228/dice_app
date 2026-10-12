import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Play Dice',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  static const String happyImage = 'assets/happy.jpeg';
  static const String sadImage = 'assets/sad.jpeg';

  int dice1 = 1;
  int dice2 = 1;
  int total = 2;
  String imagePath = sadImage;

  final Random _random = Random();

  void roll() {
    setState(() {
      dice1 = _random.nextInt(6) + 1;
      dice2 = _random.nextInt(6) + 1;
      total = dice1 + dice2;
      imagePath = total >= 10 ? happyImage : sadImage;
    });
  }

  void reset() {
    setState(() {
      dice1 = 1;
      dice2 = 1;
      total = 2;
      imagePath = sadImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: scheme.primaryContainer,
        leading: const Icon(Icons.casino),
        centerTitle: true,
        title: Text(
          'Play Dice',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: scheme.onPrimaryContainer,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Total is $total',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imagePath, height: 200),
                  const SizedBox(height: 12),
                  Text(
                    total >= 10 ? 'You Win' : 'You Lose',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: dice1),
                Dice(value: dice2),
              ],
            ),
            const SizedBox(height: 60),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.yellow,
                    ),
                    onPressed: roll,
                    child: const Text('roll'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.yellow,
                    ),
                    onPressed: reset,
                    child: const Text('reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}