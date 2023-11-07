class Quiz {
  final String question;
  final List<Answer> answers;

  Quiz({required this.question, required this.answers});
}

class Answer {
  final String answer;
  final Map<String, int> classScores;
  final Map<String, int> raceScores;
  final Map<String, int> backgroundScores;

  Answer(
      {required this.answer,
      required this.classScores,
      required this.raceScores,
      required this.backgroundScores});
}
