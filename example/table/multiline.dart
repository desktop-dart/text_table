import 'package:text_table/text_table.dart';

main() {
  final tab = TableRenderer().render([
    ['Messi', 'Barcelona FC' * 5, 80],
    ['Christiano Ronaldo', 'Real Madrid', 30],
    ['Luiz Suarez', 'Barcelona FC', 50]
  ], columns: [
    'Player',
    'Team',
    'Goals'
  ]);
  print(tab);
}
