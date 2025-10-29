import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/local_category_model.dart';

void main() {
  final rand = Random();

  LocalCategoryModel randomCategory() {
    final color = Color.fromARGB(
      rand.nextInt(256),
      rand.nextInt(256),
      rand.nextInt(256),
      rand.nextInt(256),
    );

    return LocalCategoryModel(
      id: 'id_${rand.nextInt(999999)}',
      name: 'Category_${rand.nextInt(9999)}',
      color: color,
    );
  }

  group('🧩 LocalCategoryModel serialization (using color.value)', () {
    test('toMap() correctly converts model to map', () {
      final model = randomCategory();
      final map = model.toMap();

      expect(map['id'], equals(model.id));
      expect(map['name'], equals(model.name));
      expect(map['color'], equals(model.color.toARGB32()));
    });

    test('fromMap() correctly reconstructs model', () {
      final model = randomCategory();
      final map = model.toMap();

      final fromMap = LocalCategoryModel.fromMap(map);

      expect(fromMap.id, equals(model.id));
      expect(fromMap.name, equals(model.name));
      expect(fromMap.color, equals(model.color));
    });

    test('toJson() correctly encodes model', () {
      final model = randomCategory();
      final jsonString = model.toJson();

      final decoded = jsonDecode(jsonString);
      expect(decoded['id'], equals(model.id));
      expect(decoded['name'], equals(model.name));
      expect(decoded['color'], equals(model.color.toARGB32()));
    });

    test('fromJson() correctly decodes model', () {
      final model = randomCategory();
      final jsonString = model.toJson();

      final fromJson = LocalCategoryModel.fromJson(jsonString);
      expect(fromJson.id, equals(model.id));
      expect(fromJson.name, equals(model.name));
      expect(fromJson.color, equals(model.color));
    });

    test('Round-trip: model → json → model maintains integrity', () {
      final model = randomCategory();

      final roundTrip = LocalCategoryModel.fromJson(model.toJson());

      expect(roundTrip.id, equals(model.id));
      expect(roundTrip.name, equals(model.name));
      expect(roundTrip.color, equals(model.color));
    });

    test('toString() includes id, name, and color', () {
      final model = randomCategory();
      final str = model.toString();

      expect(str, contains(model.id));
      expect(str, contains(model.name));
      expect(str, contains('Color'));
    });
  });
}
