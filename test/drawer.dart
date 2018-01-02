import 'package:text_table/text_table.dart';

main() {
  print(TableDrawer.line([], 20, Border.def.topLine, [pad()]));
  print(TableDrawer.line([], 20, Border.def.separatorLine, [pad()]));
  print(TableDrawer.line([], 20, Border.def.bottomLine, [pad()]));

  print('');

  print(TableDrawer.line(
      [5, 10, 5], 24, Border.def.topLine, [pad(), pad(), pad()]));
  print(TableDrawer.line(
      [5, 10, 5], 24, Border.def.separatorLine, [pad(), pad(), pad()]));
  print(TableDrawer.line(
      [5, 10, 5], 24, Border.def.bottomLine, [pad(), pad(), pad()]));
}
