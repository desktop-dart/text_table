library text_table.style;

part 'border.dart';
part 'line.dart';

class Align {
  final int id;

  final String text;

  const Align._(this.id, this.text);

  static const Align left = const Align._(0, 'Left');

  static const Align center = const Align._(1, 'Center');

  static const Align right = const Align._(2, 'Right');
}
