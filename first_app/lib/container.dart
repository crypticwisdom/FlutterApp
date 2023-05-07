import 'package:flutter/material.dart';
import 'package:first_app/dice_roller.dart';

class StyledContainer extends StatelessWidget {
  List<Color> colors;
  StyledContainer({super.key, required this.colors});

  void rollDice() {
    print("-------");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter)),
        child: Center(
          child: DiceRoller(),
        ));
  }
}
