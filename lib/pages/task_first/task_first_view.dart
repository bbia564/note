import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_task/main.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:super_tooltip/super_tooltip.dart';

import 'task_first_logic.dart';

class TaskFirstPage extends StatefulWidget {
  const TaskFirstPage({Key? key}) : super(key: key);

  @override
  State<TaskFirstPage> createState() => _TaskFirstPageState();
}

class _TaskFirstPageState extends State<TaskFirstPage> {
  TaskFirstLogic controller = Get.put(TaskFirstLogic());

  final tipsController = SuperTooltipController();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<TaskFirstLogic>(
                init: TaskFirstLogic(),
                builder: (_) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: <Widget>[
                      <Widget>[
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          child: const Text(
                            '#',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ).decorated(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(4)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Task',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ].toRow(),
                      const SizedBox(
                        height: 10,
                      ),
                      controller.taskList.isEmpty
                          ? Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(22),
                              child: <Widget>[
                                Image.asset(
                                  'assets/noData.webp',
                                  width: 67,
                                  height: 67,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Unadded task',
                                  style: TextStyle(color: Color(0xffb9b9b9)),
                                ),
                              ].toColumn(),
                            ).decorated(
                              color: const Color(0xfff4f6fa),
                              borderRadius: BorderRadius.circular(12))
                          : ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: controller.taskList.length,
                              itemBuilder: (_, index) {
                                var entity = controller.taskList[index];
                                return SuperTooltip(
                                  showBarrier: true,
                                  onHide: () {
                                    selectedIndex = -1;
                                    controller.update();
                                  },
                                  content: Container(
                                    width: 84,
                                    height: 60,
                                    color: Colors.white,
                                    child: <Widget>[
                                      const Text(
                                        'Delete',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ).gestures(onTap: () {
                                        selectedIndex = -1;
                                        controller.update();
                                        tipsController.hideTooltip();
                                        controller.dbTask.deleteTask(entity);
                                        controller.getData();
                                      }),
                                      const Text(
                                        'Recover',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ).gestures(onTap: () {
                                        selectedIndex = -1;
                                        controller.update();
                                        tipsController.hideTooltip();
                                        entity.hadDone = 0;
                                        controller.dbTask.updateTask(entity);
                                        controller.getData();
                                      })
                                    ].toColumn(
                                        separator: Divider(
                                      height: 15,
                                      color: Colors.grey[300],
                                    )),
                                  ),
                                  controller: selectedIndex == index
                                      ? tipsController
                                      : null,
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(12),
                                    child: <Widget>[
                                      Image.asset(
                                        'assets/${entity.hadDone == 0 ? 'unselect' : 'selected'}.webp',
                                        width: 16,
                                        height: 16,
                                        fit: BoxFit.cover,
                                      ).gestures(onTap: () {
                                        if (entity.hadDone == 0) {
                                          entity.hadDone = 1;
                                          controller.dbTask.updateTask(entity);
                                          controller.update();
                                        }
                                      }),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: <Widget>[
                                        Text(
                                          entity.title,
                                          style: TextStyle(
                                              color: entity.hadDone == 0
                                                  ? Colors.black
                                                  : Colors.black45,
                                              fontWeight: FontWeight.bold,
                                              decorationStyle: entity.hadDone ==
                                                      0
                                                  ? null
                                                  : TextDecorationStyle.solid,
                                              decoration: entity.hadDone == 0
                                                  ? TextDecoration.none
                                                  : TextDecoration.lineThrough),
                                        ),
                                        Text(
                                          entity.createdTimeStr,
                                          style: const TextStyle(
                                              color: Color(0xffc3c3c3),
                                              fontSize: 12),
                                        )
                                      ].toColumn(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start))
                                    ].toRow(),
                                  )
                                      .decorated(
                                          color: const Color(0xfff4f6fa),
                                          borderRadius:
                                              BorderRadius.circular(12))
                                      .marginOnly(bottom: 10)
                                      .gestures(onTap: () {
                                    if (entity.hadDone == 0) {
                                      return;
                                    }
                                    selectedIndex = index;
                                    controller.update();
                                    Future.delayed(
                                        const Duration(milliseconds: 50), () {
                                      tipsController.showTooltip();
                                    });
                                  }),
                                );
                              }),
                      const SizedBox(
                        height: 10,
                      ),
                      <Widget>[
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          child: const Text(
                            '#',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ).decorated(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(4)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Note',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ].toRow(),
                      const SizedBox(
                        height: 10,
                      ),
                      controller.noteList.isEmpty
                          ? Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(22),
                              child: <Widget>[
                                Image.asset(
                                  'assets/noData.webp',
                                  width: 67,
                                  height: 67,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Unadded note',
                                  style: TextStyle(color: Color(0xffb9b9b9)),
                                ),
                              ].toColumn(),
                            ).decorated(
                              color: const Color(0xfff4f6fa),
                              borderRadius: BorderRadius.circular(12))
                          : ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: controller.noteList.length,
                              itemBuilder: (_, index) {
                                final entity = controller.noteList[index];
                                return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  child: <Widget>[
                                    Text(
                                      entity.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      entity.content,
                                      style: const TextStyle(
                                          color: Color(0xff777777),
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      entity.createdTimeStr,
                                      style: const TextStyle(
                                          color: Color(0xffc3c3c3),
                                          fontSize: 12),
                                    )
                                  ].toColumn(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start),
                                )
                                    .decorated(
                                        color: const Color(0xfff4f6fa),
                                        borderRadius: BorderRadius.circular(12))
                                    .marginOnly(bottom: 10);
                              })
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  );
                }).marginAll(15)),
      ),
    );
  }
}
