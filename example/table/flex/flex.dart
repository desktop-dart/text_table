import 'package:text_table/text_table.dart';

main() {
  final renderer = TableRenderer(padding: Padding.same(2));
  final tab = renderer.render([
    ['Messi', 'Barcelona FC', 80],
    ['Christiano Ronaldo', 'Real Madrid', 30],
    ['Luiz Suarez', 'Barcelona FC', 50]
  ], columns: [
    ColSpec(name: 'Player', width: Flex(2)),
    ColSpec(name: 'Team', width: Flex(1)),
    ColSpec(name: 'Goals', width: Flex(1), align: Align.right)
  ], width: 120);
  print(tab);
}
