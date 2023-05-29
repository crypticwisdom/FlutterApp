import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/models/quiz_question.dart';
import 'package:second_app/results_screen.dart';

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
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  chooseAnswer(String answer) {
    // Used to add a user's answer to a question to 'selectedAnswer' list.
    selectedAnswers.add(answer);

    // use this if-statement to know when to rennder the result screen
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // print(selectedAnswers);
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    // restart quiz button
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        choosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

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
          child: screenWidget,
        ),
      ),
    ); // Pass in Screeens as value to this Scaffold. E.g: StartScreen, Quiz Screen, Queestion
  }
}
