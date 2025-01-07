import 'package:intl/intl.dart';

class TaskEntity {
  int id;
  DateTime createdTime;
  int type;
  String title;
  String content;
  int hadDone;

  TaskEntity(
      {required this.id,
      required this.createdTime,
      required this.type,
      required this.title,
      required this.content,
      required this.hadDone});

  factory TaskEntity.fromJson(Map<String, dynamic> json) {
    return TaskEntity(
        id: json['id'],
        createdTime: DateTime.parse(json['createdTime']),
        type: json['type'],
        title: json['title'],
        content: json['content'],
        hadDone: json['hadDone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'title': title,
      'content': content,
      'hadDone': hadDone
    };
  }

  String get createdTimeStr => DateFormat('yyyy.MM.dd').format(createdTime);
}
