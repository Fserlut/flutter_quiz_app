class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final listToShuffle = List.of(answers);
    listToShuffle.shuffle();
    return listToShuffle;
  }
}
