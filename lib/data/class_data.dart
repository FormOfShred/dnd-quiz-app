import 'package:dungeon_buddy/model/quiz_model.dart';
import 'package:flutter/material.dart';

final List<Quiz> classData = [
  Quiz(question: "Choose a social style", answers: [
    Answer(answer: "Introverted", scores: {
      "Rogue": 2,
      "Paladin": -1,
      "Druid": 1,
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
  Quiz(question: "Choose an element", answers: [
    Answer(answer: "Fire", scores: {
      "Fighter": 3,
      "Sorcerer": 2,
      "Barbarian": 1,
      "Paladin": -1,
    }),
    Answer(answer: "Water", scores: {
      "Paladin": 3,
      "Wizard": 2,
      "Bard": 1,
      "Fighter": -1,
    }),
    Answer(answer: "Earth", scores: {
      "Druid": 2,
      "Ranger": 2,
      "Warlock": 1,
      "Rogue": -1,
    }),
    Answer(answer: "Air", scores: {
      "Cleric": 3,
      "Monk": 2,
      "Rogue": 1,
      "Druid": -1,
    }),
  ]),
  Quiz(question: "Choose a movitation", answers: [
    Answer(answer: "Knowledge", scores: {
      "Monk": 3,
      "Wizard": 2,
      "Druid": 1,
      "Ranger": -1,
    }),
    Answer(answer: "Protecting loved ones", scores: {
      "Cleric": 3,
      "Paladin": 2,
      "Fighter": 1,
      "Warlock": -1,
    }),
    Answer(answer: "Power", scores: {
      "Warlock": 3,
      "Sorcerer": 2,
      "Barbarian": 1,
      "Cleric": -1,
    }),
    Answer(answer: "Adventure", scores: {
      "Ranger": 3,
      "Rogue": 2,
      "Bard": 1,
      "Wizard": -1,
    }),
  ]),
  Quiz(question: "Choose a pet", answers: [
    Answer(
        answer: Image.asset(
          'assets/animals/owl.jpg',
          semanticLabel: 'Owl',
        ),
        scores: {
          "Paladin": 3,
          "Fighter": 2,
          "Druid": 1,
          "Ranger": -1,
        }),
    Answer(
        answer: Image.asset(
          'assets/animals/cat.jpg',
          semanticLabel: 'Cat',
        ),
        scores: {
          "Wizard": 3,
          "Rogue": 2,
          "Cleric": 1,
          "Sorcerer": -1,
        }),
    Answer(
        answer: Image.asset(
          'assets/animals/wolf.jpg',
          semanticLabel: 'Wolf',
        ),
        scores: {
          "Ranger": 3,
          "Barbarian": 2,
          "Monk": 1,
          "Paladin": -1,
        }),
    Answer(
        answer: Image.asset('assets/animals/snake.jpg', semanticLabel: 'Snake'),
        scores: {
          "Sorcerer": 3,
          "Warlock": 2,
          "Bard": 1,
          "Wizard": -1,
        }),
  ]),
  Quiz(question: "Choose a season", answers: [
    Answer(answer: "Spring", scores: {
      "Druid": 3,
      "Monk": 2,
      "Cleric": 1,
      "Sorcerer": -1,
    }),
    Answer(answer: "Summer", scores: {
      "Barbarian": 3,
      "Fighter": 2,
      "Ranger": 1,
      "Warlock": -1,
    }),
    Answer(answer: "Autumn", scores: {
      "Bard": 3,
      "Rogue": 2,
      "Sorcerer": 1,
      "Paladin": -1,
    }),
    Answer(answer: "Winter", scores: {
      "Warlock": 3,
      "Paladin": 2,
      "Wizard": 1,
      "Barbarian": -1,
    }),
  ]),
];
