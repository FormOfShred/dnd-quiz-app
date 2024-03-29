class Quiz {
  final String question;
  final List<Answer> answers;

  Quiz({required this.question, required this.answers});
}

class Answer {
  // answer can be string or image
  final dynamic answer;
  final Map<String, int> scores;

  Answer({
    required this.answer,
    required this.scores,
  });
}
