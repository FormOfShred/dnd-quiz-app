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
          shadowColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 2,
          title: Column(
            children: [
              Image.asset(
                'assets/logo/dungeon_buddy_logo.png',
                height: 50,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              Text(
                'Dungeon Buddy',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          toolbarHeight: 100,
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              const Text("Welcome to Dungeon Buddy!",
                  style: TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              const MyCard(title: "Start Quiz", route: "/quiz"),
              const MyCard(title: "Randomize", route: "/random"),
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600))),
            )),
      );
}
