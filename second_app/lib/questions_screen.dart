import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectedAnswer;

  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  void answerQuestion(String answer) {
    // The 'widget' keyword is used to access properties of a widget class
    //inside the state class.
    widget.onSelectedAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[questionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentquestion.getShuffledList().map((text) {
              return AnswerButton(
                  text: text,
                  onTap: () {
                    answerQuestion(text);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
