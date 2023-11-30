import 'package:dungeon_buddy/data/character_state_data.dart';
import 'package:dungeon_buddy/model/database_helper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHelper dbHelper;
  int characters = 0;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper();
    dbHelper.initDB().whenComplete(() {
      setState(() {
        // dbhelper.getcharacters
        dbHelper.getCharacters().then((value) {
          setState(() {
            characters = value.length;
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
            'Dungeon Buddy',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          toolbarHeight: 100,
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              /*Image.asset(
                '',
              ),*/
              const MyCard(title: "Create Character", route: "/quiz"),
              const SizedBox(height: 20),
              Visibility(
                visible: characters >= 1,
                child: const MyCard(
                    title: "Character Overview", route: "/overview"),
              ),
            ],
          )),
        ),
      );
}

class MyCard extends StatelessWidget {
  final String title;
  final String? route;
  const MyCard({Key? key, required this.title, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 100,
        child: Card(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, route!, arguments: {
                  'questionIndex': 0,
                  'characterState': CharacterState(),
                });
              },
              borderRadius: BorderRadius.circular(10),
              child: Center(
                  child: Text(title,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 20))),
            )),
      );
}
