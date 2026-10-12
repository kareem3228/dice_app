import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int value; // 1 to 6

  const Dice({super.key, required this.value});

  static const List<IconData> _icons = [
    Icons.looks_one,
    Icons.looks_two,
    Icons.looks_3,
    Icons.looks_4,
    Icons.looks_5,
    Icons.looks_6,
  ];

  @override
  Widget build(BuildContext context) {
    return Icon(
      _icons[value - 1],
      size: 80,
      color: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}