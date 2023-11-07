import 'dart:io';
import 'package:dungeon_buddy/data/background_data.dart';
import 'package:dungeon_buddy/data/class_data.dart';
import 'package:dungeon_buddy/data/race_data.dart';
import 'package:dungeon_buddy/model/quiz_model.dart' as my_quiz_model;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  const Quiz({Key? key, required this.questionIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 2,
          title: const Text(
            'Quiz',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, '/', (route) => false),
          ),
        ),
        body: QuizUI(questionIndex: questionIndex),
      );
}

class QuizUI extends StatefulWidget {
  final int questionIndex;
  const QuizUI({super.key, required this.questionIndex});

  @override
  State<QuizUI> createState() => _QuizUIState();
}

class _QuizUIState extends State<QuizUI> {
  int tappedCardIndex = -1;
  final List<my_quiz_model.Quiz> mainQuiz = [
    ...classData,
    ...raceData,
    ...backgroundData
  ];

  onTapCard(int index) {
    setState(() {
      tappedCardIndex = index;
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    debugPrint('path: $directory.path');
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/quiz.txt');
  }

  Future<File> writeCharacter(String character) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(character);
  }

  Future<String> readCharacters() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      debugPrint(contents);
      return contents;
    } catch (e) {
      debugPrint(e.toString());
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mainQuiz[widget.questionIndex].question,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 20),
              Column(
                children: [
                  for (var i = 0;
                      i < mainQuiz[widget.questionIndex].answers.length;
                      i++) ...[
                    AnswerCard(
                      answer: mainQuiz[widget.questionIndex].answers[i].answer,
                      isTapped: tappedCardIndex == i,
                      onTap: () => onTapCard(i),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () => {
                  if (tappedCardIndex == -1)
                    {
                      null,
                    }
                  else
                    {
                      writeCharacter(mainQuiz[widget.questionIndex]
                          .answers[tappedCardIndex]
                          .answer),
                      readCharacters(),
                      if (widget.questionIndex < mainQuiz.length - 1)
                        {
                          Navigator.pushNamed(context, '/quiz',
                              arguments: widget.questionIndex + 1),
                        }
                      else
                        {Navigator.pushNamed(context, '/result')}
                    }
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isTapped;
  final VoidCallback onTap;
  const AnswerCard({
    super.key,
    required this.answer,
    required this.isTapped,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: isTapped
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(answer,
                style: TextStyle(
                  color: isTapped
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                  fontSize: 20,
                )),
          ),
        ),
      ),
    );
  }
}
