import 'package:text_table/text_table.dart';

main() {
  // Left align
  {
    final tab = TableRenderer().render([
      ['Messi', 'Barcelona FC', 80],
      ['Christiano Ronaldo', 'Real Madrid', 30],
      ['Luiz Suarez', 'Barcelona FC', 50]
    ], columns: [
      Column(name: 'Player', width: Fixed(10)),
      Column(name: 'Team', width: Fixed(10)),
      Column(name: 'Goals', width: Fixed(10))
    ]);
    print(tab);
  }
}