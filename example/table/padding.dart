import 'package:text_table/text_table.dart';

main() {
  final Table tab = table(['Player', 'Team', 'Goals'],
      globalPadding: pad(before: 2, after: 2))
    ..row(['Messi', 'Barcelona FC', 80])
    ..row(['Christiano Ronaldo', 'Real Madrid', 30])
    ..row(['Luiz Suarez', 'Barcelona FC', 50]);
  print(tab);
}
