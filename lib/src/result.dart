import 'package:dungeon_buddy/data/character_state_data.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final CharacterState characterState;
  const Result({Key? key, required this.characterState}) : super(key: key);

  Map<String, String> characterData(CharacterState character) {
    return character.calculateCharacter();
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
                  child: ResultCard(
                    character: characterData(characterState),
                  )))));
}

class ResultCard extends StatelessWidget {
  final Map<String, String> character;
  const ResultCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Card(
          color: Theme.of(context).colorScheme.surface,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("YOUR CHARACTER",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text(
                  'Character: ${character["Class"]}',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Race: ${character["Race"]}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Background: ${character["Background"]}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          )),
    );
  }
}
