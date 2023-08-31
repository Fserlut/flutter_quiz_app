import 'package:flutter/material.dart';

class QuestionResultItem extends StatelessWidget {
  const QuestionResultItem({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
  });

  final int questionIndex;
  final String question;
  final String userAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text((questionIndex + 1).toString()),
        Expanded(
          child: Column(
            children: [
              Text(question),
              Text(correctAnswer),
              Text(userAnswer),
            ],
          ),
        ),
      ],
    );
  }
}
