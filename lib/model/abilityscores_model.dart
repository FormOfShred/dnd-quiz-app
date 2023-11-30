class AbilityScores {
  final int? id;
  final int characterId;
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  AbilityScores(
      {this.id,
      required this.characterId,
      required this.strength,
      required this.dexterity,
      required this.constitution,
      required this.intelligence,
      required this.wisdom,
      required this.charisma});

  AbilityScores.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        characterId = res["characterId"],
        strength = res["strength"],
        dexterity = res["dexterity"],
        constitution = res["constitution"],
        intelligence = res["intelligence"],
        wisdom = res["wisdom"],
        charisma = res["charisma"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'characterId': characterId,
      'strength': strength,
      'dexterity': dexterity,
      'constitution': constitution,
      'intelligence': intelligence,
      'wisdom': wisdom,
      'charisma': charisma
    };
  }

  @override
  String toString() {
    return 'AbilityScores(characterId: $characterId, strength: $strength, dexterity: $dexterity, constitution: $constitution, intelligence: $intelligence, wisdom: $wisdom, charisma: $charisma)';
  }
}
