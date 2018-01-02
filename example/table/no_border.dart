import 'package:text_table/text_table.dart';

main() {
  final Table tab = table(['Player', 'Team', 'Goals'],
      globalPadding: pad(after: 5), border: Border.compact)
    ..row(['Messi', 'Barcelona FC', 80])
    ..row(['Christiano Ronaldo', 'Real Madrid', 30])
    ..row(['Luiz Suarez', 'Barcelona FC', 50]);
  print(tab);
}
