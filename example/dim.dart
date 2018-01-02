import 'package:text_table/src/dimension/dimension.dart';

main() {
  final sizes = <Size>[fixed(5), fixed(10), fixed(5)];
  print(Size.fixedAdd(sizes));
}
