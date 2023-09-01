import 'package:flutter/material.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/result_screen.dart';
import 'package:second_app/start_screen.dart';

import 'package:second_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeScreen;
  List<String> answers = [];

  void changeScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // Убого выглядит тип тут, но я пока не знаю как тут делают
  // интерфейсы, да и вообще есть они тут :)
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> res = [];

    for (var i = 0; i < answers.length; i++) {
      res.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': answers[i],
      });
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    Widget activeWidget = StartScreen(() {
      answers = [];
      changeScreen();
    });

    void addAnswer(String answer) {
      answers.add(answer);

      if (answers.length == questions.length) {
        setState(() {
          activeScreen = 'result-screen';
        });
      }
    }

    void restartQuiz() {
      setState(() {
        answers = [];
        activeScreen = 'start-screen';
      });
    }

    if (activeScreen == 'questions-screen') {
      activeWidget = QuestionsScreen(addAnswer);
    }

    if (activeScreen == 'result-screen') {
      activeWidget = ResultScreen(
        summaryData: getSummaryData(),
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 104, 20, 182),
                Color.fromARGB(255, 87, 20, 204),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Center(child: activeWidget),
          ),
        ),
      ),
    );
  }
}
