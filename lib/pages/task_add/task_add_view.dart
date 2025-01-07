import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_task/main.dart';
import 'package:note_task/pages/task_first/task_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'task_add_logic.dart';

class TaskAddPage extends GetView<TaskAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fa),
      appBar: AppBar(
        title: const Text('Add note'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: TaskTextField(
                    hintText: 'Title',
                    value: controller.title,
                    maxLength: 20,
                    onChange: (value) {
                      controller.title = value;
                    })).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            const SizedBox(
              height: 15,
            ),
            Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: <Widget>[
                      const Text(
                        'Content',
                        style: TextStyle(color: Colors.black45),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TaskTextField(
                          value: controller.content,
                          padding: EdgeInsets.zero,
                          maxLength: 200,
                          maxLines: 8,
                          onChange: (value) {
                            controller.content = value;
                          })
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
                .decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
            const SizedBox(
              height: 35,
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                'Commit',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
                .decorated(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12))
                .gestures(onTap: () {
              controller.commit();
            })
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
