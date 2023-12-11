import 'dart:io';

import 'package:dungeon_buddy/data/background_data.dart';
import 'package:dungeon_buddy/data/character_state_data.dart';
import 'package:dungeon_buddy/data/class_data.dart';
import 'package:dungeon_buddy/data/race_data.dart';
import 'package:dungeon_buddy/model/quiz_model.dart' as my_quiz_model;
import 'package:dungeon_buddy/widgets/answer_card.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:path_provider/path_provider.dart';

class QuizUI extends StatefulWidget {
  final int questionIndex;
  final CharacterState characterState;
  const QuizUI(
      {super.key, required this.questionIndex, required this.characterState});

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
        child: Column(children: [
          Column(
            children: [
              GFProgressBar(
                percentage: (widget.questionIndex + 1) / mainQuiz.length,
                backgroundColor: Theme.of(context).colorScheme.surface,
                progressBarColor: Theme.of(context).colorScheme.primary,
                type: GFProgressType.linear,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(mainQuiz[widget.questionIndex].question,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 18,
                        )),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        for (var i = 0;
                            i < mainQuiz[widget.questionIndex].answers.length;
                            i++) ...[
                          AnswerCard(
                            answer: mainQuiz[widget.questionIndex]
                                .answers[i]
                                .answer,
                            isTapped: tappedCardIndex == i,
                            onTap: () => onTapCard(i),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 50,
                        child: GFButton(
                          onPressed: () {
                            if (tappedCardIndex == -1) {
                              null;
                            } else {
                              for (var map in mainQuiz[widget.questionIndex]
                                  .answers[tappedCardIndex]
                                  .scores
                                  .entries) {
                                widget.characterState
                                    .updateScores(map.key, map.value);
                              }
                              ;
                              if (widget.questionIndex < mainQuiz.length - 1) {
                                Navigator.pushNamed(context, '/quiz',
                                    arguments: {
                                      'questionIndex': widget.questionIndex + 1,
                                      'characterState': widget.characterState
                                    });
                              } else {
                                Navigator.pushNamed(context, '/result',
                                    arguments: widget.characterState);
                              }
                            }
                          },
                          text: "Submit",
                          textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 18,
                          ),
                          type: GFButtonType.solid,
                          size: GFSize.LARGE,
                          color: Theme.of(context).colorScheme.primary,
                          blockButton: true,
                          shape: GFButtonShape.pills,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
