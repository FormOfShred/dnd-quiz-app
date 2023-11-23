import 'package:dungeon_buddy/model/character_model.dart';
import 'package:flutter/material.dart';

class CharacterView extends StatelessWidget {
  final Character character;
  const CharacterView({super.key, required this.character});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 2,
        title: const Text(
          'Characters',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SizedBox(
        height: 200,
        child: BaseInformation(character: character),
      ));
}

class BaseInformation extends StatelessWidget {
  const BaseInformation({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Picture?')]),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(character.recommendedClass,
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onBackground)),
          Text(character.recommendedRace,
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onBackground)),
          Text(
            character.recommendedBackground,
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    ]);
  }
}
