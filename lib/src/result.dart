import 'package:dungeon_buddy/data/character_state_data.dart';
import 'package:dungeon_buddy/widgets/result_card.dart';
import 'package:dungeon_buddy/widgets/save_button.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final CharacterState characterState;
  const Result({Key? key, required this.characterState}) : super(key: key);

  Map<String, String> characterData(CharacterState character) {
    return character.calculateCharacter();
  }

  Function() saveCharacter() {
    debugPrint(characterData(characterState).toString());
    return () {
      //Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)
    };
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 2,
        title: const Text(
          'Result',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      ResultCard(
                        character: characterData(characterState),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SaveButton(
                        onTap: saveCharacter,
                      ),
                    ],
                  )))));
}
