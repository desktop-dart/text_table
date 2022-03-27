import 'package:text_table/text_table.dart';

main() {
  final tab = TableRenderer(padding: Padding.same(2)).render([
    ['Messi', 'Barcelona FC', 80],
    ['Christiano Ronaldo', 'Real Madrid', 30],
    ['Luiz Suarez', 'Barcelona FC', 50]
  ], columns: [
    Column(name: 'Player', width: Flex(2)),
    Column(name: 'Team', width: Flex(1), maxWidth: Fixed(25)),
    Column(name: 'Goals', width: Flex(1), align: Align.right)
  ], width: 200);
  print(tab);
}