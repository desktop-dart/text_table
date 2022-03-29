import 'package:text_table/text_table.dart';

main() {
  // Left align
  {
    final tab = TableRenderer().render([
      ['Messi', 'Barcelona FC', 80],
      ['Christiano Ronaldo', 'Real Madrid', 30],
      ['Luiz Suarez', 'Barcelona FC', 50]
    ], columns: [
      ColSpec(name: 'Player', width: Fixed(10)),
      ColSpec(name: 'Team', width: Fixed(10)),
      ColSpec(name: 'Goals', width: Fixed(10))
    ]);
    print(tab);
  }
}
