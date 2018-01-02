import 'package:text_table/src/dimension/dimension.dart';

main() {
  final sizes = <Fixed>[fixed(5), fixed(10), fixed(5)];
  print(Fixed.sum(sizes));
}
