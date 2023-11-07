import 'package:dungeon_buddy/model/quiz_model.dart';

final List<Quiz> classData = [
  Quiz(question: "What best describes you?", answers: [
    Answer(answer: "Introverted", classScores: {
      "Druid": 2,
      "Fighter": -1,
      "Rogue": 1,
      "Wizard": 3,
    }, raceScores: {}, backgroundScores: {}),
    Answer(answer: "Slightly introverted", classScores: {
      "Monk": -1,
      "Ranger": 1,
      "Sorcerer": 2,
      "Warlock": 3,
    }, raceScores: {}, backgroundScores: {}),
    Answer(answer: "Slightly extroverted", classScores: {
      "Barbarian": 3,
      "Cleric": 2,
      "Monk": 1,
      "Warlock": -1,
    }, raceScores: {}, backgroundScores: {}),
    Answer(answer: "Extroverted", classScores: {
      "Bard": 3,
      "Fighter": 1,
      "Paladin": 2,
      "Wizard": -1,
    }, raceScores: {}, backgroundScores: {}),
  ])
];
