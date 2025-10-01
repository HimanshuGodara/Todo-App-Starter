import 'package:todo_app/entities/category_entity.dart';

abstract class CategoryRepository {
  CategoryEntity createCategory({required CategoryEntity category});
  CategoryEntity editCategory({required CategoryEntity category});
  bool deleteCategory({required CategoryEntity category});
}
