import 'package:text_table/text_table.dart';

main() {
  final tab = TableRenderer(padding: Padding.same(2)).render([
    ['Messi', 'Barcelona FC', 80],
    ['Christiano Ronaldo', 'Real Madrid', 30],
    ['Luiz Suarez', 'Barcelona FC', 50]
  ], columns: [
    ColSpec(name: 'Player', width: Fixed(104)),
    ColSpec(name: 'Team', width: Flex(1)),
    ColSpec(name: 'Goals', width: Flex(1), align: Align.right)
  ], width: 120);
  print(tab);
}
