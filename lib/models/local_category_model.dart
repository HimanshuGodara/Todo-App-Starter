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
    'name': name,
    'color': {'a': color.a, 'r': color.r, 'g': color.g, 'b': color.b},
    'id': id,
  };

  static LocalCategoryModel fromMap(Map<String, dynamic> map) {
    final c = map['color'];
    return LocalCategoryModel(
      id: map['id'],
      name: map['name'],
      color: Color.fromARGB(
        (c['a'] * 256).floor(),
        (c['r'] * 256).floor(),
        (c['g'] * 256).floor(),
        (c['b'] * 256).floor(),
      ),
    );
  }

  @override
  String toJson() => jsonEncode(toMap());

  static LocalCategoryModel fromJson(String json) => fromMap(jsonDecode(json));

  @override
  String toString() => '$runtimeType(\nid: $id,\nname: $name,\ncolor: $color)';
}
