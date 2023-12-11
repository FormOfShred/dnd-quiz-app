import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ResultCard extends StatelessWidget {
  final Map<String, String> character;
  final Function() onTap;
  const ResultCard({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GFCard(
        elevation: 5,
        title: GFListTile(
          title: Text(
            'YOUR CHARACTER',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          subTitle: Text('''
Class: ${character["Class"]}
Race: ${character["Race"]}
Background: ${character["Background"]}
''',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
        ),
        buttonBar: GFButtonBar(children: <Widget>[
          GFButton(
            onPressed: () {
              onTap();
            },
            text: 'Save character',
            icon: Icon(Icons.save,
                color: Theme.of(context).colorScheme.onPrimary, size: 20),
            color: Theme.of(context).colorScheme.primary,
            shape: GFButtonShape.pills,
          ),
          GFButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            text: 'Home',
            icon: Icon(Icons.home,
                color: Theme.of(context).colorScheme.onPrimary, size: 20),
            color: Theme.of(context).colorScheme.primary,
            shape: GFButtonShape.pills,
          ),
        ]),
      ),
    );
  }
}
