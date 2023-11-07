import 'dart:convert';

class CharacterState {
  List<Map<String, int>> characterState = [
    {
      "Barbarian": 0,
      "Bard": 0,
      "Cleric": 0,
      "Druid": 0,
      "Fighter": 0,
      "Monk": 0,
      "Paladin": 0,
      "Ranger": 0,
      "Rogue": 0,
      "Sorcerer": 0,
      "Warlock": 0,
      "Wizard": 0,
    },
    {
      "Dragonborn": 0,
      "Dwarf": 0,
      "Elf": 0,
      "Gnome": 0,
      "Half-Elf": 0,
      "Half-Orc": 0,
      "Halfling": 0,
      "Human": 0,
      "Tiefling": 0
    },
    {
      "Acolyte": 0,
      "Criminal/Spy": 0,
      "Folk Hero": 0,
      "Haunted One": 0,
      "Noble": 0,
      "Sage": 0,
      "Soldier": 0
    }
  ];

  void updateScores(String key, int value) {
    // search through maps for key and add to it's value the given value
    for (var map in characterState) {
      if (map.containsKey(key)) {
        map[key] = map[key]! + value;
      }
    }
    print(characterState);
  }

  String printCharacterState(CharacterState state) {
    String jsonString = jsonEncode(characterState);

    return jsonString;
  }

  Map<String, String> calculateCharacter() {
    // for each list in the map get the one with the highest score
    // return something like {class: "Barbarian", race: "Elf", background: "Folk Hero"}
    Map<String, String> characterMap = {
      "Class": "",
      "Race": "",
      "Background": ""
    };

    // find class with highest int
    int highestClass = 0;
    String highestClassString = "";
    for (var map in characterState[0].entries) {
      if (map.value > highestClass) {
        highestClass = map.value;
        highestClassString = map.key;
      }
      characterMap["Class"] = highestClassString;
    }

    return characterMap;
  }
}
