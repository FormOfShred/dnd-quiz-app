import 'package:dungeon_buddy/model/character_model.dart';
import 'package:dungeon_buddy/model/database_helper.dart';
import 'package:flutter/material.dart';

class CharacterView extends StatefulWidget {
  final Character character;
  const CharacterView({super.key, required this.character});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  late DatabaseHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    dbHelper.initDB().whenComplete(() async {
      setState(() {
        debugPrint('Database initialized');
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 2,
        title: Text(
          widget.character.characterName!.isEmpty
              ? 'Character'
              : widget.character.characterName!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: BaseInformation(
                character: widget.character,
                dbHelper: dbHelper,
              ),
            ),
          ],
        ),
      ));
}

class BaseInformation extends StatelessWidget {
  const BaseInformation({
    super.key,
    required this.character,
    required this.dbHelper,
  });

  final Character character;
  final DatabaseHelper dbHelper;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Picture?')]),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: Center(
                  child: TextFormField(
                    maxLines: null,
                    initialValue: character.characterName!.isEmpty
                        ? "Choose Name"
                        : character.characterName,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) => {
                      dbHelper.updateCharacterName(character.id!, value),
                      character.characterName = value
                    },
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
              ),
            ],
          ),
          Text(character.recommendedClass,
              style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onBackground)),
          Text(character.recommendedRace,
              style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onBackground)),
          Text(
            character.recommendedBackground,
            style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    ]);
  }
}
