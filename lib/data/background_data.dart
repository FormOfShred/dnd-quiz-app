import 'package:dungeon_buddy/model/quiz_model.dart';

final List<Quiz> backgroundData = [
  Quiz(question: "What is your favorite time of the day?", answers: [
    Answer(answer: "Morning", scores: {
      "Sage": 2,
      "Noble": 1,
      "Haunted One": -1,
    }),
    Answer(answer: "Afternoon", scores: {
      "Acolyte": 2,
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
      "Criminal/Spy": 1,
      "Sage": -1,
    }),
  ])
];
