import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  late List<String> results = [];

  Future<List<String>?> getQuizResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    debugPrint(prefs.getStringList('characters').toString());

    return prefs.getStringList('characters');
  }

  @override
  void initState() {
    super.initState();
    getQuizResult().then((value) => setState(() {
          results = value ?? [];
          debugPrint(results.toString());
        }));
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
          for (var i = 0; i < results.length; i++) ...[
            CharacterPreview(result: results[i]),
          ]
        ],
      ));
}

class CharacterPreview extends StatelessWidget {
  const CharacterPreview({
    super.key,
    required this.result,
  });

  final String result;

  // extract class and race from {Class: Wizard, Race: Dragonborn, Background: Acolyte
  String extractClass(String result) {
    return result.substring(result.indexOf('Class: ') + 7,
        result.indexOf(',', result.indexOf('Class: ') + 7));
  }

  // extract race from {Class: Wizard, Race: Dragonborn, Background: Acolyte}
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: Card(
            color: Theme.of(context).colorScheme.surface,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(
              child: Row(
                children: [
                  Text(extractClass(result),
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
            )));
  }
}
