import 'package:dungeon_buddy/data/character_state_data.dart';
import 'package:dungeon_buddy/model/character_model.dart';
import 'package:dungeon_buddy/model/database_helper.dart';
import 'package:dungeon_buddy/widgets/result_card.dart';
import 'package:flutter/material.dart';

class RandomCharacter extends StatefulWidget {
  const RandomCharacter({Key? key}) : super(key: key);

  @override
  State<RandomCharacter> createState() => _RandomCharacterState();
}

class _RandomCharacterState extends State<RandomCharacter> {
  late DatabaseHelper dbHelper;

  Map<String, String> randomCharacterData() {
    return CharacterState().randomCharacter();
  }

  Future<void> saveCharacter() async {
    debugPrint(randomCharacterData.toString());
    String recommendedClass = randomCharacterData()['Class']!;
    String recommendedRace = randomCharacterData()['Race']!;
    String recommendedBackground = randomCharacterData()['Background']!;

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
          'Random Character',
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
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      ResultCard(
                          character: randomCharacterData(),
                          onTap: saveCharacter)
                    ],
                  )))));
}
