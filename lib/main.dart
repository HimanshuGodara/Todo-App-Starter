import 'dart:math' show Random;

import 'package:flutter/material.dart';

import 'package:todo_app/models/local_category_model.dart';
import 'package:todo_app/models/local_task_model.dart';
import 'package:todo_app/widgets/category_tag.dart';
import 'package:todo_app/widgets/task_list_item.dart';

import 'package:uuid/uuid.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              spacing: 12,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Hello World!'),
                TaskListItem(task: createRandomTask()),
                TaskListItem(task: createRandomTask()),
                TaskListItem(task: createRandomTask()),
                TaskListItem(task: createRandomTask()),
                CategoryTag(category: createRandomCategory()),
                CategoryTag(category: createRandomCategory()),
                CategoryTag(category: createRandomCategory()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

LocalTaskModel createRandomTask() {
  late final LocalTaskModel result;
  result = LocalTaskModel(
    title: Uuid().v4(),
    deadline: DateTime.now(),
    category: createRandomCategory(),
    isDone: Random().nextBool(),
  );
  return result;
}

LocalCategoryModel createRandomCategory() {
  late final LocalCategoryModel result;
  final String randomName = Uuid().v4();
  final String randomId = Uuid().v4();
  final Color randomColor = Color.fromARGB(
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
  );
  result = LocalCategoryModel(
    name: randomName,
    color: randomColor,
    id: randomId,
  );
  return result;
}
