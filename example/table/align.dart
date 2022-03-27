import 'package:text_table/text_table.dart';

main() {
  // Left align
  {
    final tab = TableRenderer().render([
      ['Messi', 'Barcelona FC', 80],
      ['Christiano Ronaldo', 'Real Madrid', 30],
      ['Luiz Suarez', 'Barcelona FC', 50]
    ], columns: [
      Column(name: 'Player', width: Fixed(25)),
      Column(name: 'Team', width: Fixed(25)),
      Column(name: 'Goals', width: Fixed(10))
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
      Column(name: 'Player', width: Fixed(25), align: Align.right),
      Column(name: 'Team', width: Fixed(25), align: Align.right),
      Column(name: 'Goals', width: Fixed(10), align: Align.right)
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
      Column(name: 'Player', width: Fixed(25), align: Align.center),
      Column(name: 'Team', width: Fixed(25), align: Align.center),
      Column(name: 'Goals', width: Fixed(10), align: Align.center)
    ]);
    print(tab);
  }

  /*{
    final Table tab = table(['Player', 'Team', 'Goals'],
        colWidths: [fixed(25), fixed(25), fixed(10)], globalAlign: Align.center)
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
    final Table tab = table(['Player', 'Team', 'Goals'],
        colWidths: [fixed(25), fixed(25), fixed(10)], globalAlign: Align.right)
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
    final Table tab = table(['Player', 'Team', 'Goals'],
        colWidths: [fixed(25), fixed(25), fixed(10)],
        aligns: [Align.left, Align.center, Align.right])
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }*/
}
