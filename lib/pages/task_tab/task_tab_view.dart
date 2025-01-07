import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_task/pages/task_add/task_add_view.dart';
import 'package:note_task/pages/task_first/task_first_view.dart';
import 'package:note_task/pages/task_second/task_second_view.dart';

import '../../main.dart';
import 'task_tab_logic.dart';

class TaskTabPage extends GetView<TaskTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          TaskFirstPage(),
          TaskAddPage(),
          TaskSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navTaskBars()),
    );
  }

  Widget _navTaskBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,color: primaryColor,size: 40,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          controller.showStyle();
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
