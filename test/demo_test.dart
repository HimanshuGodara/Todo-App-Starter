import 'package:flutter_test/flutter_test.dart';

void main() {
  group('global group', () {
    setUpAll(() {
      print('settuing things up via setup All');
    });

    test('a demo test1', () {
      expect(1 + 3, 4);
    });

    group('group1', () {
      setUp(() {
        print('setting things up via setup');
      });
      test('a demo test2', () {
        expect(1 + 3, 4);
      });
      test('a demo test3', () {
        expect(1 + 3, 4);
      });
    });
    test('a demo test4', () {
      expect(1 + 3, 4);
    });
    tearDown(() {
      print('tearing things down via tear down function');
    });
    tearDownAll(() {
      print('tearing things down via tear down ALL function');
    });
  });
}
