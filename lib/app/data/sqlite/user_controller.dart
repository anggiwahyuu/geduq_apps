import 'package:geduq_apps/app/data/sqlite/user_model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  var userById = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAllUser();
  }

  Future<Database> initDB() async {
    final dir = await getDatabasesPath();
    final path = "${dir}users.db";

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            select_character TEXT NOT NULL,
            score_pre_test INTEGER NOT NULL,
            times_pre_test INTEGER NOT NULL,
            is_pre_test_done TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> loadAllUser() async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query("users");

    userList.value = List.generate(maps.length, (index) {
      return User.fromMap(maps[index]);
    });
  }

  Future<void> loadUserById(User user) async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps =
        await db.query("users", where: 'id = ?', whereArgs: [user.id]);

    userById.value = List.generate(maps.length, (index) {
      return User.fromMap(maps[index]);
    });
  }

  Future<void> createUser(User user) async {
    final db = await initDB();
    await db.insert("users", user.toMap());
    loadAllUser();
  }

  Future<void> updateUser(String username, User user) async {
    final db = await initDB();
    await db.update("users", user.toMap(),
        where: 'username = ?', whereArgs: [user.username]);

    loadAllUser();
  }

  Future<void> deleteUser(int id) async {
    final db = await initDB();
    await db.delete("users", where: 'id = ?', whereArgs: [id]);

    loadAllUser();
  }

  Future<void> deleteAllUser(User user) async {
    final db = await initDB();
    await db.delete("users");
    loadAllUser();
  }
}
