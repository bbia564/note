import 'package:get/get.dart';
import 'package:note_task/pages/task_first/task_first_logic.dart';

import '../task_second/task_second_logic.dart';
import 'task_tab_logic.dart';

class TaskTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskTabLogic());
    Get.lazyPut(() => TaskFirstLogic());
    Get.lazyPut(() => TaskSecondLogic());
  }
}
