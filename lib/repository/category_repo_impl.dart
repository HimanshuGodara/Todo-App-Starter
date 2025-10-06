import 'package:todo_app/entities/category_entity.dart';
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

    await categoryFile.writeAsString(input.toString(), mode: FileMode.append);

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
  Future<List<CategoryEntity>> loadCategories() {
    throw UnimplementedError();
  }
}
