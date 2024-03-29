import 'package:dungeon_buddy/data/character_state_data.dart';
import 'package:dungeon_buddy/model/character_model.dart';
import 'package:dungeon_buddy/model/database_helper.dart';
import 'package:dungeon_buddy/widgets/result_card.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final CharacterState characterState;
  const Result({Key? key, required this.characterState}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late DatabaseHelper dbHelper;

  Map<String, String> characterData(CharacterState character) {
    return character.calculateCharacter();
  }

  Future<void> saveCharacter() async {
    debugPrint(characterData(widget.characterState).toString());
    String recommendedClass = characterData(widget.characterState)['Class']!;
    String recommendedRace = characterData(widget.characterState)['Race']!;
    String recommendedBackground =
        characterData(widget.characterState)['Background']!;

    Character character = Character(
        recommendedClass: recommendedClass,
        recommendedRace: recommendedRace,
        recommendedBackground: recommendedBackground,
        characterName: "");

    await dbHelper.insertCharacter(character);
    debugPrint("Character saved");
    if (mounted) {
      setState(() {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
  }

  Future<void> initializeDatabase() async {
    await dbHelper.initDB().whenComplete(() async {
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
          'Result',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
        ),
      ),
      body: FutureBuilder(
          future: dbHelper.initDB(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              ResultCard(
                                character: characterData(widget.characterState),
                                onTap: saveCharacter,
                              ),
                            ],
                          ))));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }));
}
