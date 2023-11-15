import 'package:dungeon_buddy/model/quiz_model.dart';

final List<Quiz> classData = [
  Quiz(question: "What best describes you?", answers: [
    Answer(answer: "Introverted", scores: {
      "Druid": 2,
      "Fighter": -1,
      "Rogue": 1,
      "Wizard": 3,
    }),
    Answer(answer: "Slightly introverted", scores: {
      "Monk": -1,
      "Ranger": 1,
      "Sorcerer": 2,
      "Warlock": 3,
    }),
    Answer(answer: "Slightly extroverted", scores: {
      "Barbarian": 3,
      "Cleric": 2,
      "Monk": 1,
      "Warlock": -1,
    }),
    Answer(answer: "Extroverted", scores: {
      "Bard": 3,
      "Fighter": 1,
      "Paladin": 2,
      "Wizard": -1,
    }),
  ]),
];
