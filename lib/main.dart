import 'package:dungeon_buddy/data/character_state_data.dart';
import 'package:dungeon_buddy/model/character_model.dart';
import 'package:dungeon_buddy/src/character_view.dart';
import 'package:dungeon_buddy/src/home.dart';
import 'package:dungeon_buddy/src/overview.dart';
import 'package:dungeon_buddy/src/quiz.dart';
import 'package:dungeon_buddy/src/result.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: myColorScheme,
        useMaterial3: true,
        /*textTheme: GoogleFonts.cinzelTextTheme(
          Theme.of(context).textTheme,
        ),
        fontFamily: GoogleFonts.cinzel().fontFamily,*/
      ),
      routes: {
        '/quiz': (context) {
          return Quiz(
              questionIndex: (ModalRoute.of(context)?.settings.arguments
                  as Map)['questionIndex'] as int,
              characterState: (ModalRoute.of(context)?.settings.arguments
                  as Map)['characterState'] as CharacterState);
        },
        '/result': (context) => Result(
            characterState:
                ModalRoute.of(context)?.settings.arguments as CharacterState),
        '/overview': (context) => const Overview(),
        '/character': (context) => CharacterView(
              character:
                  ModalRoute.of(context)?.settings.arguments as Character,
            ),
      },
      home: const Home(),
    );
  }
}

const myColorScheme = ColorScheme(
    primary: Color(0xFF44BBA4), // Custom primary color
    secondary: Color(0xFFE7BB41), // Custom secondary color
    background: Color(0xFF393E41), // Custom background color
    surface: Color(0xFFD3D0CB), // Custom surface color
    onPrimary: Color(0xFF000000), // Custom text color on primary
    onSecondary: Color(0xFF000000), // Custom text color on secondary
    onBackground: Color(0xFFFFFFFF), // Custom text color on background
    onSurface: Color(0xFF000000),
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.white // Custom text color on surface
    );
