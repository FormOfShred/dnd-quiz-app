class Character {
  final int? id;
  final String recommendedClass;
  final String recommendedRace;
  final String recommendedBackground;
  List<int> abilityScores = <int>[]; // 0 = STR, 1 = DEX, 2 = CON, 3 = INT, 4 = WIS, 5 = CHA
  String? characterName;


  Character(
      {this.id,
      required this.recommendedClass,
      required this.recommendedRace,
      required this.recommendedBackground,
      required this.abilityScores,
      this.characterName});

  Character.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        recommendedClass = res["recommendedClass"],
        recommendedRace = res["recommendedRace"],
        recommendedBackground = res["recommendedBackground"],
        abilityScores = res["abilityScores"],
        characterName = res["characterName"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'recommendedClass': recommendedClass,
      'recommendedRace': recommendedRace,
      'recommendedBackground': recommendedBackground,
      'abilityScores': abilityScores,
      'characterName': characterName
    };
  }

  @override
  String toString() {
    return 'Character(recommendedClass: $recommendedClass, recommendedRace: $recommendedRace, recommendedBackground: $recommendedBackground, abilityScores: $abilityScores, characterName: $characterName)';
  }
}
