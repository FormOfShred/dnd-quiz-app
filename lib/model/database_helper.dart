import 'package:dungeon_buddy/model/abilityscores_model.dart';
import 'package:dungeon_buddy/model/character_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  late Database db;

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, 'dungeon_buddy.db'),
      onCreate: (database, version) async {
        await database.execute('''
  CREATE TABLE characters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    recommendedClass TEXT NOT NULL,
    recommendedRace TEXT NOT NULL,
    recommendedBackground TEXT NOT NULL,
    characterName TEXT
  )
''');

        await database.execute('''
  CREATE TABLE abilityScores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    characterId INTEGER NOT NULL,
    strength INTEGER NOT NULL,
    dexterity INTEGER NOT NULL,
    constitution INTEGER NOT NULL,
    intelligence INTEGER NOT NULL,
    wisdom INTEGER NOT NULL,
    charisma INTEGER NOT NULL,
    FOREIGN KEY (characterId) REFERENCES characters (id)
  )
''');
      },
      version: 2,
    );
  }

  // CHARACTER

  Future<int> insertCharacter(Character character) async {
    int result = await db.insert('characters', character.toMap());
    return result;
  }

  Future<Character> getCharacter(int id) async {
    final List<Map<String, Object?>> characters =
        await db.query('characters', where: 'id = ?', whereArgs: [id]);
    return Character.fromMap(characters.first);
  }

  Future<List<Character>> getCharacters() async {
    final List<Map<String, Object?>> characters = await db.query('characters');
    return characters.map((e) => Character.fromMap(e)).toList();
  }

  Future<void> deleteCharacter(int id) async {
    await db.delete('characters', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateCharacterName(int id, String characterName) async {
    await db.update('characters', {'characterName': characterName},
        where: 'id = ?', whereArgs: [id]);
  }

  // ABILITY SCORE
  Future<int> insertAbilityScores(AbilityScores abilityScores) async {
    int result = await db.insert('abilityScores', abilityScores.toMap());
    return result;
  }

  Future<AbilityScores> getAbilityScores(int id) async {
    final List<Map<String, Object?>> abilityScores = await db
        .query('abilityScores', where: 'characterId = ?', whereArgs: [id]);
    return AbilityScores.fromMap(abilityScores.first);
  }

  Future<void> updateAbilityScores(AbilityScores abilityScores) async {
    await db.update('abilityScores', abilityScores.toMap(),
        where: 'characterId = ?', whereArgs: [abilityScores.characterId]);
  }
}
