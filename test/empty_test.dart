import 'package:text_table/text_table.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {});

    test('NoRowsNoColumns', () {
      final renderer = TableRenderer();
      print(renderer.render([]));
    });

    test('NoRows', () {
      final renderer = TableRenderer();
      print(renderer.render([],
          columns: [ColSpec(name: 'First'), ColSpec(name: 'Second')]));
    });
  });
}
