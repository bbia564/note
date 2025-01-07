
import 'package:get/get.dart';
import 'package:note_task/db_task/task_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBTask extends GetxService {
  late Database dbBase;

  Future<DBTask> init() async {
    await createTaskDB();
    return this;
  }

  createTaskDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'task.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createTaskTable(db);
        });
  }

  createTaskTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS task (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, title TEXT, content TEXT, hadDone INTEGER)');
  }

  insertTask(TaskEntity entity) async {
    final id = await dbBase.insert('task', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'title': entity.title,
      'content': entity.content,
      'hadDone': entity.hadDone,
    });
    return id;
  }

  updateTask(TaskEntity entity) async {
    await dbBase.update('task', {
      'title': entity.title,
      'content': entity.content,
      'hadDone': entity.hadDone,
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  deleteTask(TaskEntity entity) async {
    await dbBase.delete('task', where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanTaskData() async {
    await dbBase.delete('task');
  }

  Future<List<TaskEntity>> getTaskAllData() async {
    var result = await dbBase.query('task', orderBy: 'createdTime DESC');
    return result.map((e) => TaskEntity.fromJson(e)).toList();
  }
}
