import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var randomNumbs = Random();
  var current = 1;

  void rollDice() {
    setState(() {
      current = randomNumbs.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/dice-$current.png", width: 180),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          child: Text(
            "ROLL-DICE",
            style: TextStyle(fontSize: 19.9, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
