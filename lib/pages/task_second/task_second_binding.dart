import 'package:get/get.dart';

import 'task_second_logic.dart';

class TaskSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskSecondLogic());
  }
}
