
import 'package:get/get.dart';
import 'package:note_task/db_task/db_task.dart';
import 'package:note_task/db_task/task_entity.dart';

class TaskFirstLogic extends GetxController {

  DBTask dbTask = Get.find<DBTask>();

  List<TaskEntity> taskList = [];
  List<TaskEntity> noteList = [];

  void getData() async {
    final result = await dbTask.getTaskAllData();
    taskList = result.where((e) => e.type == 0).toList();
    noteList = result.where((e) => e.type == 1).toList();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
