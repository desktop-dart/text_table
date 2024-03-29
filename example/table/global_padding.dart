import 'package:text_table/text_table.dart';

main() {
  final renderer = TableRenderer(padding: Padding.same(1));
  final tab = renderer.render([
    ['Messi', 'Barcelona FC', 80],
    ['Christiano Ronaldo', 'Real Madrid', 30],
    ['Luiz Suarez', 'Barcelona FC', 50]
  ], columns: [
    'Player',
    'Team',
    ColSpec(name: 'Goals', padding: Padding.same(2)),
  ]);
  print(tab);
}
