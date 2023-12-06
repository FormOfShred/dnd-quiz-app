import 'package:flutter/material.dart';

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
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text(
                  'Class: ${character["Class"]}',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Race: ${character["Race"]}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Background: ${character["Background"]}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          )),
    );
  }
}
