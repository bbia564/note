import 'package:get/get.dart';

import 'task_table_logic.dart';

class TaskTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
