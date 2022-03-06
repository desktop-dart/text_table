import 'package:text_table/text_table.dart';

main() {
  final Table tab =
      table([null, null, null], colWidths: [fixed(25), fixed(25), fixed(10)])
        ..row(['Messi', 'Barcelona FC', 80])
        ..row(['Christiano Ronaldo', 'Real Madrid', 30])
        ..row(['Luiz Suarez', 'Barcelona FC', 50]);
  print(tab);
}
