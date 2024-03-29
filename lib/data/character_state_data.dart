import 'dart:math';

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
      "Tiefling": 0,
      "Drow": 0,
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
    for (var map in characterState) {
      if (map.containsKey(key)) {
        map[key] = map[key]! + value;
      }
    }
  }

  Map<String, String> calculateCharacter() {
    Map<String, String> characterMap = {
      "Class": "",
      "Race": "",
      "Background": "",
      "Name": "",
      "Image": "",
    };

    // find class with highest int
    int highestClass = 0;
    String highestClassString = characterState[0].entries.first.key;
    for (var map in characterState[0].entries) {
      if (map.value > highestClass) {
        highestClass = map.value;
        highestClassString = map.key;
      }
      characterMap["Class"] = highestClassString;
    }

    // find race with highest int
    int highestRace = 0;
    String highestRaceString = characterState[1].entries.first.key;
    for (var map in characterState[1].entries) {
      if (map.value > highestRace) {
        highestRace = map.value;
        highestRaceString = map.key;
      }
      characterMap["Race"] = highestRaceString;
    }

    // find background with highest int
    int highestBackground = 0;
    String highestBackgroundString = characterState[2].entries.first.key;
    for (var map in characterState[2].entries) {
      if (map.value > highestBackground) {
        highestBackground = map.value;
        highestBackgroundString = map.key;
      }
      characterMap["Background"] = highestBackgroundString;
    }

    return characterMap;
  }

  Map<String, String> randomCharacter() {
    CharacterState characterState = CharacterState();
    Map<String, String> characterMap = {
      "Class": "",
      "Race": "",
      "Background": "",
      "Name": "",
      "Image": "",
    };

    // get random class
    int randomClass = Random().nextInt(12);
    // find class with randomClass index
    characterMap["Class"] =
        characterState.characterState[0].entries.elementAt(randomClass).key;

    // find race with highest int
    int randomRace = Random().nextInt(10);
    characterMap["Race"] =
        characterState.characterState[1].entries.elementAt(randomRace).key;

    // find background with highest int
    int randomBackground = Random().nextInt(7);
    characterMap["Background"] = characterState.characterState[2].entries
        .elementAt(randomBackground)
        .key;

    return characterMap;
  }
}
