import 'package:dungeon_buddy/model/quiz_model.dart';
import 'package:flutter/material.dart';

final List<Quiz> raceData = [
  Quiz(question: "Pick a color", answers: [
    Answer(answer: Image.asset('assets/colors/red.jpg'), scores: {
      "Dragonborn": 1,
      "Tiefling": 2,
      "Drow": -1,
    }),
    Answer(answer: Image.asset('assets/colors/blue.png'), scores: {
      "Elf": 2,
      "Half-Elf": 1,
      "Dwarf": -1,
    }),
    Answer(answer: Image.asset('assets/colors/yellow.png'), scores: {
      "Dwarf": 2,
      "Halfling": 1,
      "Elf": -1,
    }),
    Answer(answer: Image.asset('assets/colors/black.png'), scores: {
      "Drow": 3,
      "Half-Orc": 2,
      "Human": 1,
      "Dragonborn": -1,
    }),
  ])
];
