import 'package:todo_app/entities/category_entity.dart';
import 'package:todo_app/models/local_category_model.dart';
import 'package:todo_app/repository/category_repository.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

final class CategoryRepoImpl extends CategoryRepository {
  @override
  Future<CategoryEntity> createCategory({
    required CategoryEntity category,
  }) async {
    final input = category;

    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final categoryFile = File('${appDocumentsDir.path}/categories');
    if (!(await categoryFile.exists())) {
      await categoryFile.create();
    }

    await categoryFile.writeAsString(
      '${input.toJson()}\n',
      mode: FileMode.append,
    );

    return input;
  }

  @override
  Future<bool> deleteCategory({required CategoryEntity category}) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<CategoryEntity> editCategory({required CategoryEntity category}) {
    // TODO: implement editCategory
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryEntity>> loadCategories() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final categoryFile = File('${appDocumentsDir.path}/categories');

    final result = <CategoryEntity>[];

    // check if the file exists
    if ((await categoryFile.exists())) {
      final contents = await categoryFile.readAsString();
      final entries = contents.split('\n');
      for (var item in entries) {
        if (item.trim().isNotEmpty) {
          final categories = item.split('}{').join('}\n{').split('\n');
          if (categories.isEmpty) continue;
          for (var category in categories) {
            if (category != '{}') {
              result.add(LocalCategoryModel.fromJson(item));
            }
          }
        }
      }
      // if the file exists => read the file
    }
    return result;
  }
}
