import 'package:dungeon_buddy/data/character_state_data.dart';
import 'package:dungeon_buddy/widgets/quiz_ui.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final CharacterState characterState;
  const Quiz(
      {Key? key, required this.questionIndex, required this.characterState})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 2,
          title: Text(
            'Quiz',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, '/', (route) => false),
          ),
        ),
        body: QuizUI(
            questionIndex: questionIndex, characterState: characterState),
      );
}
