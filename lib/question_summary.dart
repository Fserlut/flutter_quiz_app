import 'package:flutter/material.dart';
import 'package:second_app/question_result_item.dart';

class QuestionSummart extends StatelessWidget {
  const QuestionSummart(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...summaryData.map(
          (e) {
            return QuestionResultItem(
              questionIndex: e['question_index'] as int,
              question: e['question'] as String,
              userAnswer: e['user_answer'] as String,
              correctAnswer: e['correct_answer'] as String,
            );
          },
        )
      ],
    );
  }
}
