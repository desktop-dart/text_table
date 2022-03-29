import 'package:text_table/text_table.dart';

main() {
  final rows = [
    ['Messi', 'Barcelona FC', 80],
    ['Christiano Ronaldo', 'Real Madrid', 30],
    ['Luiz Suarez', 'Barcelona FC', 50]
  ];
  final columns = ['Player', 'Team', 'Goals'];

  {
    print('Default:');
    final tab = TableRenderer().render(rows, columns: columns);
    print(tab);
  }

  {
    print('Rounded:');
    final tab =
        TableRenderer(border: Border.round).render(rows, columns: columns);
    print(tab);
  }

  {
    print('Compact:');
    final tab =
        TableRenderer(border: Border.compact).render(rows, columns: columns);
    print(tab);
  }

  {
    print('Compact1:');
    final tab =
        TableRenderer(border: Border.compact).render(rows, columns: columns);
    print(tab);
  }

  {
    print('Simple:');
    final tab =
        TableRenderer(border: Border.simple).render(rows, columns: columns);
    print(tab);
  }

  {
    print('Single line:');
    final tab =
        TableRenderer(border: Border.singleLine).render(rows, columns: columns);
    print(tab);
  }

  {
    print('Double lines:');
    final tab = TableRenderer(border: Border.doubleLines)
        .render(rows, columns: columns);
    print(tab);
  }

  {
    print('Double lines2:');
    final tab = TableRenderer(border: Border.doubleLines2)
        .render(rows, columns: columns);
    print(tab);
  }

  {
    print('Double lines3:');
    final tab = TableRenderer(border: Border.doubleLines3)
        .render(rows, columns: columns);
    print(tab);
  }
}
