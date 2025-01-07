import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../db_task/db_task.dart';
import '../../db_task/task_entity.dart';
import '../task_first/task_first_logic.dart';

class TaskAddLogic extends GetxController {

  DBTask dbTask = Get.find<DBTask>();

  String title = '';
  String content = '';

  void commit() async {
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input title');
      return;
    }
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input content');
      return;
    }
    await dbTask.insertTask(TaskEntity(
      id: 0,
      createdTime: DateTime.now(),
      type: 1,
      title: title,
      content: content,
      hadDone: 0
    ));
    Get.back();
  }

}
