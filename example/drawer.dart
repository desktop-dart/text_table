import 'package:text_table/text_table.dart';

main() {
  print(TableDrawer.line([], 20, Border.def.topLine));
  print(TableDrawer.line([], 20, Border.def.separatorLine));
  print(TableDrawer.line([], 20, Border.def.bottomLine));

  print('');

  print(TableDrawer.line([5, 10, 5], 24, Border.def.topLine));
  print(TableDrawer.line([5, 10, 5], 24, Border.def.separatorLine));
  print(TableDrawer.line([5, 10, 5], 24, Border.def.bottomLine));
}