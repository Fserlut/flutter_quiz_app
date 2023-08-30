import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/question_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.addAnswer, {super.key});

  final void Function(String value) addAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerHandler(String value) {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        widget.addAnswer(value);
        currentQuestionIndex += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          questions[currentQuestionIndex].text,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        ...questions[currentQuestionIndex].getShuffledAnswers().map((e) {
          return QuestionButton(
              buttonText: e,
              onTap: () {
                answerHandler(e);
              });
        })
      ],
    );
  }
}
