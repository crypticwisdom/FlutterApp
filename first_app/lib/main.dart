import 'package:flutter/material.dart';
import 'package:first_app/container.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.amber,
      body: StyledContainer(colors: [Colors.purple, Colors.white12]),
    ),
  ));
}
