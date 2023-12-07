import 'package:flutter/material.dart';

class Character {
  final int? id;
  final String recommendedClass;
  final String recommendedRace;
  final String recommendedBackground;
  String? characterName;
  Image? characterImage;

  Character(
      {this.id,
      required this.recommendedClass,
      required this.recommendedRace,
      required this.recommendedBackground,
      this.characterName,
      this.characterImage});

  Character.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        recommendedClass = res["recommendedClass"],
        recommendedRace = res["recommendedRace"],
        recommendedBackground = res["recommendedBackground"],
        characterName = res["characterName"],
        characterImage = res["characterImage"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'recommendedClass': recommendedClass,
      'recommendedRace': recommendedRace,
      'recommendedBackground': recommendedBackground,
      'characterName': characterName,
      'characterImage': characterImage,
    };
  }

  @override
  String toString() {
    return 'Character(recommendedClass: $recommendedClass, recommendedRace: $recommendedRace, recommendedBackground: $recommendedBackground, characterName: $characterName, characterImage: $characterImage)';
  }
}
