import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/models/local_category_model.dart';

void main() {
  final testCategory = LocalCategoryModel(
    name: 'testCategory',
    color: Colors.white,
    id: 'testID',
  );
  final testMap = {
    'name': 'testCategory',
    'color': {'a': 256, 'r': 256, 'g': 256, 'b': 256},
    'id': 'testID',
  };
  final testString =
      '{'
      '"name":"testCategory",'
      '"color":{"a":256,"r":256,"g":256,"b":256},'
      '"id":"testID"'
      '}';
  group('testing implementation for local category model', () {
    test('toJson implementation', () {
      // arrange
      // take care of by setup()
      // act
      final result = testCategory.toJson();
      // assert
      expect(result, testString);
    });
  });
}
