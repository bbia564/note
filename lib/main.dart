import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_task/db_task/db_task.dart';
import 'package:note_task/pages/task_add/task_add_binding.dart';
import 'package:note_task/pages/task_add/task_add_view.dart';
import 'package:note_task/pages/task_first/task_first_binding.dart';
import 'package:note_task/pages/task_first/task_first_view.dart';
import 'package:note_task/pages/task_second/task_second_binding.dart';
import 'package:note_task/pages/task_second/task_second_view.dart';
import 'package:note_task/pages/task_tab/task_tab_binding.dart';
import 'package:note_task/pages/task_tab/task_tab_view.dart';
import 'package:note_task/pages/task_table/task_table_binding.dart';
import 'package:note_task/pages/task_table/task_table_view.dart';

import 'db_task/db_feel.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.white;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBTask().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Notes,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: const Color(0xfffcfcfc),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Notes = [
  GetPage(name: '/', page: () => const TaskTableView(), binding: TaskTableBinding()),
  GetPage(name: '/taskTab', page: () => TaskTabPage(), binding: TaskTabBinding()),
  GetPage(name: '/taskFirst', page: () => const TaskFirstPage(), binding: TaskFirstBinding()),
  GetPage(name: '/taskFeel', page: () => const DbFeel()),
  GetPage(name: '/taskSecond', page: () => TaskSecondPage(), binding: TaskSecondBinding()),
  GetPage(name: '/taskAdd', page: () => TaskAddPage(), binding: TaskAddBinding()),
];