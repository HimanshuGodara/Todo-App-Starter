import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:todo_app/models/local_category_model.dart';
import 'package:todo_app/repository/category_repo_impl.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 24,
            children: [
              Text('Hello World!'),
              FilledButton(
                onPressed: () async {
                  print('button pressed');
                  // add button =>
                  // ✅ generate a random category and
                  // ✅ add to the file
                  final randomCategory = createRandomCategory();
                  print('random category created as: \n$randomCategory');
                  print(
                    'random category created as: \n${randomCategory.toString()}',
                  );
                  print(
                    'random category created as: \n${randomCategory.toMap()}',
                  );
                  print(
                    'random category created as: \n${randomCategory.toMap().toString()}',
                  );
                  // final categoryRepo = CategoryRepoImpl();

                  // await categoryRepo.createCategory(category: randomCategory);
                  // print('create category callback has finished');
                },
                child: Text('Add a random category'),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
