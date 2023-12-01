import 'package:sqflite/sqflite.dart' as sql;

class DbHelper {
  static Future<void> tables(sql.Database database) async {
    await database.execute("CREATE TABLE user("
        "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, "
        "token STRING, "
        "isVerified INTEGER)");
  }

  static Future<sql.Database> Db() {
    return sql.openDatabase("Graduation project", version: 1,
        onCreate: (sql.Database database, int version) async {
      await tables(database);
    });
  }

  static Future<int> createUser(int isVerified, String token) async {
    final db = await DbHelper.Db();

    final data = {
      'id': 1,
      'token': token,
      'isVerified': isVerified,
    };

    final id = await db.insert("user", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await DbHelper.Db();
    return db.query("user", orderBy: "id");
  }
}
