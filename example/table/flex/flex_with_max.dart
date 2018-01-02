import 'package:text_table/text_table.dart';

main() {
  final Table tab = table(['Player', 'Team', 'Goals'],
      width: 90,
      colWidths: [flex(2), flex(1), fixed(5)],
      maxColWidths: [fixed(22)],
      globalPadding: padEven(1))
    ..row(['Messi', 'Barcelona FC', 80])
    ..row(['Christiano Ronaldo', 'Real Madrid', 30])
    ..row(['Luiz Suarez', 'Barcelona FC', 50]);
  print(tab);
}
