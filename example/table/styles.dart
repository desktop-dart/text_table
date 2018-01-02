import 'package:text_table/text_table.dart';

main() {
  {
    print('Default style:');
    final Table tab = table(['Player', 'Team', 'Goals'])
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
    print('Default rounded:');
    final Table tab = table(
      ['Player', 'Team', 'Goals'],
      border: Border.defRound,
    )
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
    print('No borders:');
    final Table tab = table(['Player', 'Team', 'Goals'],
        globalPadding: pad(after: 5), border: Border.compact)
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
    print('Simple:');
    final Table tab = table(
      ['Player', 'Team', 'Goals'],
      border: Border.simple,
    )
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
    print('Single line:');
    final Table tab = table(
      ['Player', 'Team', 'Goals'],
      border: Border.singleLine,
    )
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
    print('Double lines:');
    final Table tab = table(
      ['Player', 'Team', 'Goals'],
      border: Border.doubleLines,
    )
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
    print('Double lines2:');
    final Table tab = table(
      ['Player', 'Team', 'Goals'],
      border: Border.doubleLines2,
    )
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }

  {
    print('Double lines3:');
    final Table tab = table(
      ['Player', 'Team', 'Goals'],
      border: Border.doubleLines3,
    )
      ..row(['Messi', 'Barcelona FC', 80])
      ..row(['Christiano Ronaldo', 'Real Madrid', 30])
      ..row(['Luiz Suarez', 'Barcelona FC', 50]);
    print(tab);
  }
}
