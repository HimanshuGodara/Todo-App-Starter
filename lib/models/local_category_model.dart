import 'dart:convert';

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

  static LocalCategoryModel fromMap(Map<String, dynamic> map) {
    final result = LocalCategoryModel(
      name: map['name'],
      color: map['color'],
      id: map['id'],
    );
    return result;
  }

  @override
  String toJson() {
    return jsonEncode(toMap());
  }

  static LocalCategoryModel fromJson(String json) {
    return fromMap(jsonDecode(json));
  }

  @override
  String toString() {
    final result = '$runtimeType(\nid: $id,\nname: $name,\ncolor: $color)';
    return result;
  }
}
