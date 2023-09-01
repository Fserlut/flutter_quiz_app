import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final isCorrect = correctAnswer == userAnswer;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: isCorrect ? Colors.cyan : Colors.red,
          child: Text(
            (questionIndex + 1).toString(),
            style: GoogleFonts.lato(
              color: isCorrect ? Colors.black : Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                correctAnswer,
                style: GoogleFonts.lato(
                  color: Colors.cyan,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                userAnswer,
                style: GoogleFonts.lato(
                  color: isCorrect ? Colors.cyan : Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
