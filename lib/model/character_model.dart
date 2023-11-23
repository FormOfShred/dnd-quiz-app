class Character {
  final int? id;
  final String recommendedClass;
  final String recommendedRace;
  final String recommendedBackground;

  Character(
      {this.id,
      required this.recommendedClass,
      required this.recommendedRace,
      required this.recommendedBackground});

  Character.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        recommendedClass = res["recommendedClass"],
        recommendedRace = res["recommendedRace"],
        recommendedBackground = res["recommendedBackground"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'recommendedClass': recommendedClass,
      'recommendedRace': recommendedRace,
      'recommendedBackground': recommendedBackground
    };
  }

  @override
  String toString() {
    return 'Character(recommendedClass: $recommendedClass, recommendedRace: $recommendedRace, recommendedBackground: $recommendedBackground)';
  }
}
