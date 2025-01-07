import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:note_task/db_task/db_task.dart';
import 'package:note_task/db_task/task_entity.dart';
import 'package:note_task/pages/task_first/task_first_logic.dart';
import 'package:note_task/pages/task_first/task_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

class TaskTabLogic extends GetxController {
  PageController pageController = PageController();
  var currentIndex = 0.obs;

  DBTask dbTask = Get.find<DBTask>();

  showStyle() async {
    Get.dialog(AlertDialog(
      content: SizedBox(
        width: double.infinity,
        height: 180,
        child: <Widget>[
          InkWell(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                'Add task',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              Get.back();
              addTask();
            },
          ),
          InkWell(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                'Add note',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              Get.back();
              Get.toNamed('/taskAdd')?.then((_) {
                TaskFirstLogic firstLogic = Get.put(TaskFirstLogic());
                firstLogic.getData();
              });
            },
          ),
          InkWell(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                'Cancel',
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ].toColumn(
            separator: Divider(
          height: 1,
          color: Colors.grey[300],
        )),
      ),
    ));
  }

  void addTask() async {
    String title = '';
    Get.dialog(AlertDialog(
      title: const Text('Add task',textAlign: TextAlign.center,),
      content: Container(
        width: double.infinity,
        height: 50,
        child: TaskTextField(value: title,maxLength: 20,onChange: (value) {
          title = value;
        }),
      ).decorated(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffd3d3d3))),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (title.isEmpty) {
              Fluttertoast.showToast(msg: 'Please enter the title');
              return;
            }
            final entity = TaskEntity(id: 0, createdTime: DateTime.now(), type: 0, title: title, content: '', hadDone: 0);
            await dbTask.insertTask(entity);
            TaskFirstLogic firstLogic = Get.put(TaskFirstLogic());
            firstLogic.getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ));
  }
}
