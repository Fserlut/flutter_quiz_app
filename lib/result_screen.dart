import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.summaryData,
    required this.restartQuiz,
  });

  final List<Map<String, Object>> summaryData;
  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    final totalQuestion = questions.length;
    final correctAnswers = summaryData
        .where((e) => e['correct_answer'] == e['user_answer'])
        .length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'You answered $correctAnswers of $totalQuestion questions correctly!',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 300,
          child: SingleChildScrollView(
            child: QuestionSummart(summaryData),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        TextButton.icon(
          onPressed: restartQuiz,
          icon: const Icon(
            Icons.restart_alt,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(),
          label: Text(
            'Restart quiz',
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
