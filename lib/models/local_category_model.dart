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
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': {
        'a': (color.a * 256).floor(),
        'r': (color.r * 256).floor(),
        'g': (color.g * 256).floor(),
        'b': (color.b * 256).floor(),
      },
    };
  }

  @override
  String toJson() => jsonEncode(toMap());

  /// ✅ Static factory methods instead of overrides
  static LocalCategoryModel fromMap(Map<String, dynamic> map) {
    final colorMap = map['color'];
    return LocalCategoryModel(
      id: map['id'],
      name: map['name'],
      color: Color.fromARGB(
        (colorMap['a'] * 256).floor(),
        (colorMap['r'] * 256).floor(),
        (colorMap['g'] * 256).floor(),
        (colorMap['b'] * 256).floor(),
      ),
    );
  }

  static LocalCategoryModel fromJson(String json) => fromMap(jsonDecode(json));

  @override
  String toString() => '$runtimeType(\nid: $id,\nname: $name,\ncolor: $color)';
}
