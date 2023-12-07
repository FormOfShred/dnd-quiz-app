import 'package:dungeon_buddy/model/quiz_model.dart';
import 'package:flutter/material.dart';

final List<Quiz> raceData = [
  Quiz(question: "Pick a color", answers: [
    Answer(
        answer: Image.asset(
          'assets/colors/red.jpg',
          semanticLabel: "Red",
        ),
        scores: {
          "Dragonborn": 1,
          "Tiefling": 2,
          "Drow": -1,
        }),
    Answer(
        answer: Image.asset(
          'assets/colors/blue.png',
          semanticLabel: "Blue",
        ),
        scores: {
          "Elf": 2,
          "Half-Elf": 1,
          "Dwarf": -1,
        }),
    Answer(
        answer: Image.asset(
          'assets/colors/yellow.png',
          semanticLabel: "Yellow",
        ),
        scores: {
          "Dwarf": 2,
          "Halfling": 1,
          "Elf": -1,
        }),
    Answer(
        answer: Image.asset(
          'assets/colors/black.png',
          semanticLabel: "Black",
        ),
        scores: {
          "Drow": 3,
          "Half-Orc": 2,
          "Human": 1,
          "Tiefling": -1,
        }),
  ]),
  Quiz(question: "Choose a music genre", answers: [
    Answer(answer: "Rock/Metal", scores: {
      "Half-Orc": 2,
      "Tiefling": 2,
      "Dragonborn": 1,
      "Human": -1,
    }),
    Answer(answer: "Pop", scores: {
      "Half-Elf": 2,
      "Halfling": 1,
      "Drow": -1,
    }),
    Answer(answer: "Classical", scores: {
      "Human": 2,
      "Elf": 1,
      "Half-Orc": -1,
    }),
    Answer(answer: "Indie", scores: {
      "Drow": 2,
      "Dwarf": 1,
      "Half-Elf": -1,
    }),
  ]),
  Quiz(question: "Choose a superpower", answers: [
    Answer(answer: "Inivisibility", scores: {
      "Tiefling": 2,
      "Halfling": 2,
      "Drow": 1,
      "Half-Elf": -1,
    }),
    Answer(answer: "Telekenisis", scores: {
      "Elf": 2,
      "Dragonborn": 2,
      "Halfling": -1,
    }),
    Answer(answer: "Super Strength", scores: {
      "Half-Orc": 2,
      "Dwarf": 1,
      "Drow": -1,
    }),
    Answer(answer: "Time Travel", scores: {
      "Half-Elf": 2,
      "Human": 1,
      "Dragonborn": -1,
    }),
  ]),
  Quiz(question: "Choose an time period", answers: [
    Answer(answer: "Ancient Rome", scores: {
      "Dragonborn": 2,
      "Dwarf": 1,
      "Half-Orc": 1,
      "Tiefling": -1,
    }),
    Answer(answer: "Renaissance", scores: {
      "Elf": 2,
      "Tiefling": 1,
      "Half-Elf": -1,
    }),
    Answer(answer: "Victorian Era", scores: {
      "Half-Elf": 2,
      "Drow": 1,
      "Halfling": -1,
    }),
    Answer(answer: "Roaring Twenties", scores: {
      "Halfling": 2,
      "Human": 2,
      "Elf": -1,
    }),
  ]),
  Quiz(question: "Choose an vehicle", answers: [
    Answer(answer: "Car", scores: {
      "Half-Elf": 2,
      "Dwarf": 1,
      "Human": 1,
      "Dragonborn": -1,
    }),
    Answer(answer: "Bicycle", scores: {
      "Halfling": 2,
      "Bicycle": 1,
      "Half-Elf": -1,
    }),
    Answer(answer: "Motorcycle", scores: {
      "Half-Orc": 1,
      "Tiefling": 1,
      "Elf": -1,
    }),
    Answer(answer: "Airplane", scores: {
      "Elf": 2,
      "Dragonborn": 1,
      "Half-Orc": -1,
    }),
  ]),
];
