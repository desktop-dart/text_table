import 'package:text_table/text_table.dart';

main() {
  {
    final Table tab = table(['Player', 'Team', 'Goals'],
        colWidths: [fixed(25), fixed(25), fixed(10)])
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
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
  }
}
