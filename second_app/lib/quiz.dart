import 'package:flutter/material.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
// Method 1;
// Widget? activeScreen;
//   @override
//   void initState() {
//     // This executes before the build method.
//     // It is used to also do some initialization code.
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }

  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Color.fromARGB(255, 72, 34, 136)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == "start-screen"
              ? StartScreen(switchScreen)
              : const QuestionsScreen(),
        ),
      ),
    ); // Pass in Screeens as value to this Scaffold. E.g: StartScreen, Quiz Screen, Queestion
  }
}
