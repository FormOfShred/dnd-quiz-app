import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        body: const Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              /*Image.asset(
                '',
              ),*/
              MyCard(title: "Create Character", route: "/quiz"),
              SizedBox(height: 20),
              MyCard(title: "Character Overview", route: "/"),
              SizedBox(height: 20),
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
              onTap: () => Navigator.pushNamed(context, route!, arguments: 0),
              borderRadius: BorderRadius.circular(10),
              child: Center(
                  child: Text(title,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 20))),
            )),
      );
}
