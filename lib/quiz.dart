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
  String? activeScreen;

  void changeScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeWidget = StartScreen(changeScreen);
    final List<String> answers = [];

    void addAnswer(String answer) {
      answers.add(answer);
    }

    if (activeScreen == 'questions-screen') {
      activeWidget = QuestionsScreen(addAnswer);
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
              child: Center(child: activeWidget)),
        ),
      ),
    );
  }
}
