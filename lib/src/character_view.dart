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
              child: BaseInformation(character: widget.character),
            ),
            NameRow(
              widget: widget,
              dbHelper: dbHelper,
            ),
          ],
        ),
      ));
}

class NameRow extends StatelessWidget {
  const NameRow({
    super.key,
    required this.widget,
    required this.dbHelper,
  });

  final CharacterView widget;
  final DatabaseHelper dbHelper;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: Center(
            child: TextFormField(
              maxLines: null,
              initialValue: widget.character.characterName!.isEmpty
                  ? "Add Character Name"
                  : widget.character.characterName,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (value) => {
                dbHelper.updateCharacterName(widget.character.id!, value),
                widget.character.characterName = value
              },
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        )
      ],
    );
  }
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
