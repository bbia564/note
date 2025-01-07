import 'package:get/get.dart';

import 'task_first_logic.dart';

class TaskFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskFirstLogic());
  }
}
