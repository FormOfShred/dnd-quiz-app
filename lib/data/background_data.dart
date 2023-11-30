import 'package:dungeon_buddy/model/quiz_model.dart';

final List<Quiz> backgroundData = [
  Quiz(question: "Choose a time of the day", answers: [
    Answer(answer: "Morning", scores: {
      "Sage": 2,
      "Noble": 1,
      "Haunted One": -1,
    }),
    Answer(answer: "Afternoon", scores: {
      "Acolyte": 1,
      "Folk Hero": 1,
      "Soldier": -1,
    }),
    Answer(answer: "Evening", scores: {
      "Criminal/Spy": 2,
      "Haunted One": 1,
      "Sage": -1,
    }),
    Answer(answer: "Night", scores: {
      "Soldier": 2,
      "Sage": 1,
      "Noble": -1,
    }),
  ]),
  Quiz(question: "Choose a sleeping position", answers: [
    Answer(answer: "Left side", scores: {
      "Acolyte": 2,
      "Folk Hero": 1,
      "Soldier": -1,
    }),
    Answer(answer: "Right side", scores: {
      "Soldier": 2,
      "Noble": 1,
      "Acolyte": -1,
    }),
    Answer(answer: "On your back", scores: {
      "Haunted One": 2,
      "Sage": 1,
      "Criminal/Spy": -1,
    }),
    Answer(answer: "On your stomach", scores: {
      "Criminal/Spy": 2,
      "Haunted One": 2,
      "Folk Hero": -1,
    }),
  ]),
  Quiz(question: "Choose a beverage", answers: [
    Answer(answer: "Water", scores: {
      "Acolyte": 2,
      "Haunted One": 1,
      "Noble": -1,
    }),
    Answer(answer: "Alcohol", scores: {
      "Noble": 2,
      "Folk Hero": 1,
      "Haunted One": -1,
    }),
    Answer(answer: "Juices", scores: {
      "Folk Hero": 2,
      "Sage": 1,
      "Soldier": -1,
    }),
    Answer(answer: "Energy drink", scores: {
      "Soldier": 2,
      "Criminal/Spy": 1,
      "Acolyte": -1,
    }),
  ]),
  Quiz(question: "Choose a musical instrument", answers: [
    Answer(answer: "Harp", scores: {
      "Sage": 2,
      "Acolyte": 2,
      "Criminal/Spy": -1,
    }),
    Answer(answer: "Drum", scores: {
      "Criminal/Spy": 2,
      "Soldier": 1,
      "Acolyte": -1,
    }),
    Answer(answer: "Flute", scores: {
      "Criminal/Spy": 2,
      "Noble": 1,
      "Folk Hero": -1,
    }),
    Answer(answer: "Violin", scores: {
      "Folk Hero": 2,
      "Haunted One": 1,
      "Criminal/Spy": -1,
    }),
  ]),
  Quiz(question: "Choose a genre", answers: [
    Answer(answer: "Mystery", scores: {
      "Criminal/Spy": 1,
      "Acolyte": 1,
      "Sage": -1,
    }),
    Answer(answer: "Romantic", scores: {
      "Noble": 2,
      "Folk Hero": 1,
      "Haunted One": -1,
    }),
    Answer(answer: "Sci-fi", scores: {
      "Soldier": 2,
      "Sage": 2,
      "Acolyte": -1,
    }),
    Answer(answer: "Horror", scores: {
      "Haunted One": 2,
      "Acolyte": 1,
      "Criminal/Spy": -1,
    }),
  ]),
];
