import 'package:dungeon_buddy/data/character_state_data.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final CharacterState characterState;
  const Result({Key? key, required this.characterState}) : super(key: key);

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
      body: const Center(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(20.0), child: ResultCard()))));
}

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
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
                  "Class: Barbarian",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Race: Elf",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Background: Folk Hero",
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
