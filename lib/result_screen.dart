import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/question_result_item.dart';
import 'package:second_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
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
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.restart_alt),
          style: ElevatedButton.styleFrom(),
          label: const Text(
            'Restart quiz',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
