import 'package:text_table/text_table.dart';

main() {
  // Left align
  {
    final tab = TableRenderer().render([
      ['Messi', 'Barcelona FC', 80],
      ['Christiano Ronaldo', 'Real Madrid', 30],
      ['Luiz Suarez', 'Barcelona FC', 50]
    ], columns: [
      ColSpec(name: 'Player', width: Fixed(25)),
      ColSpec(name: 'Team', width: Fixed(25)),
      ColSpec(name: 'Goals', width: Fixed(10))
    ]);
    print(tab);
  }

  // Right align
  {
    final tab = TableRenderer().render([
      ['Messi', 'Barcelona FC', 80],
      ['Christiano Ronaldo', 'Real Madrid', 30],
      ['Luiz Suarez', 'Barcelona FC', 50]
    ], columns: [
      ColSpec(name: 'Player', width: Fixed(25), align: Align.right),
      ColSpec(name: 'Team', width: Fixed(25), align: Align.right),
      ColSpec(name: 'Goals', width: Fixed(10), align: Align.right)
    ]);
    print(tab);
  }

  // Center align
  {
    final tab = TableRenderer().render([
      ['Messi', 'Barcelona FC', 80],
      ['Christiano Ronaldo', 'Real Madrid', 30],
      ['Luiz Suarez', 'Barcelona FC', 50]
    ], columns: [
      ColSpec(name: 'Player', width: Fixed(25), align: Align.center),
      ColSpec(name: 'Team', width: Fixed(25), align: Align.center),
      ColSpec(name: 'Goals', width: Fixed(10), align: Align.center)
    ]);
    print(tab);
  }

  {
    final tab = TableRenderer().render([
      ['Messi', 'Barcelona FC', 80],
      ['Christiano Ronaldo', 'Real Madrid', 30],
      ['Luiz Suarez', 'Barcelona FC', 50]
    ], columns: [
      ColSpec(name: 'Player', width: Fixed(25), align: Align.left),
      ColSpec(name: 'Team', width: Fixed(25), align: Align.center),
      ColSpec(name: 'Goals', width: Fixed(10), align: Align.right)
    ]);
    print(tab);
  }
}
