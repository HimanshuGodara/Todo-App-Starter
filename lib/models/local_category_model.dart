import 'package:todo_app/entities/category_entity.dart';

final class LocalCategoryModel extends CategoryEntity {
  LocalCategoryModel({
    required super.name,
    required super.color,
    required this.id,
  });
  final String id;

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'color': {'a': color.a, 'r': color.r, 'g': color.g, 'b': color.b},
    };
  }

  @override
  String toString() {
    final result = '$runtimeType(\nid: $id,\nname: $name,\ncolor: $color)';
    return result;
  }

  @override
  CategoryEntity fromJson(String json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  CategoryEntity fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    throw UnimplementedError();
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
