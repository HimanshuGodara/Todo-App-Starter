import 'dart:ui';

abstract class CategoryEntity {
  final String name;
  final Color color;

  CategoryEntity({required this.name, required this.color});

  Map<String, dynamic> toMap();
  CategoryEntity fromMap(Map<String, dynamic> map);
  String toJson();
  CategoryEntity fromJson(String json);
}
