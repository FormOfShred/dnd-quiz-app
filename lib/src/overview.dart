import 'package:dungeon_buddy/model/character_model.dart';
import 'package:dungeon_buddy/model/database_helper.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  late DatabaseHelper dbHelper;
  List<Character> characters = [];

  Future<List<Character>?> getQuizResult() async {
    List<Character> characters = await dbHelper.getCharacters();

    return characters;
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    dbHelper.initDB().whenComplete(() async {
      setState(() {
        debugPrint('Database initialized');
        getQuizResult().then((value) {
          setState(() {
            for (var i = 0; i < value!.length; i++) {
              characters.add(value[i]);
            }
          });
        });
      });
    });
  }

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          for (var i = 0; i < characters.length; i++) ...[
            Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) => setState(() {
                      dbHelper.deleteCharacter(characters[i].id!);
                      characters.removeAt(i);
                    }),
                background: Container(color: Colors.red),
                confirmDismiss: (direction) => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Delete Confirmation"),
                        content: const Text(
                            "Are you sure you want to delete this character?"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("CANCEL")),
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("DELETE"))
                        ],
                      ),
                    ),
                child: CharacterPreview(character: characters[i])),
          ]
        ],
      ));
}

class CharacterPreview extends StatelessWidget {
  final Character character;

  const CharacterPreview({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: GestureDetector(
          onTap: () => {debugPrint("Tapped")},
          child: Card(
              color: Theme.of(context).colorScheme.surface,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(character.recommendedClass,
                          style: const TextStyle(fontSize: 20)),
                    ),
                    Text('- ${character.recommendedRace}',
                        style: const TextStyle(fontSize: 20)),
                    Text(' - ${character.recommendedBackground}',
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
              )),
        ));
  }
}
