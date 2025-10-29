import 'dart:convert';
import 'dart:ui';

import 'package:todo_app/entities/category_entity.dart';
import 'package:flutter/material.dart';

final class LocalCategoryModel extends CategoryEntity {
  final String id;

  LocalCategoryModel({
    required super.name,
    required super.color,
    required this.id,
  });

  @override
  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'color': color.toARGB32(),
  };

  static LocalCategoryModel fromMap(Map<String, dynamic> map) {
    return LocalCategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      color: Color(map['color'] as int), // reconstruct directly
    );
  }

  @override
  String toJson() => jsonEncode(toMap());

  static LocalCategoryModel fromJson(String json) =>
      fromMap(jsonDecode(json) as Map<String, dynamic>);

  @override
  String toString() => '$runtimeType(\nid: $id,\nname: $name,\ncolor: $color)';
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalCategoryModel &&
        other.id == id &&
        other.name == name &&
        other.color.toARGB32() == color.toARGB32();
  }

  @override
  int get hashCode => Object.hashAll([id, name, color]);
}
