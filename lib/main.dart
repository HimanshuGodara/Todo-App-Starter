import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:todo_app/entities/category_entity.dart';

import 'package:todo_app/models/local_category_model.dart';

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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Hello World!'),
                ListTile(
                  onTap: () {},
                  title: Text('Tile title'),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      ColoredBox(
                        color: Colors.amber,
                        child: SizedBox(width: 4, height: 24),
                      ),
                      Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                ),
                CategoryTag(category: createRandomCategory()),
                CategoryTag(category: createRandomCategory()),
                CategoryTag(category: createRandomCategory()),
                CategoryTag(category: createRandomCategory()),
                CategoryTag(category: createRandomCategory()),
                CategoryTag(category: createRandomCategory()),
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

class CategoryTag extends StatelessWidget {
  const CategoryTag({super.key, required this.category});
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 249, 250, 251),
        border: Border.all(color: Color.fromARGB(255, 229, 231, 235)),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          ColoredBox(
            color: category.color,
            child: SizedBox(width: 4, height: 24),
          ),
          Text(category.name),
        ],
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
