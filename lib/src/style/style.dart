library text_table.style;

part 'border.dart';
part 'line.dart';

class Align {
  final int id;

  final String text;

  const Align._(this.id, this.text);

  String align(Iterable<String> characters, int width) {
    int charLen = characters.length;
    switch (this) {
      case left:
        return characters.join() + ' ' * (width - charLen);
      case center:
        int spaces = (width - charLen) ~/ 2;
        return ' ' * spaces +
            characters.join() +
            ' ' * (width - charLen - spaces);
      case right:
        return ' ' * (width - charLen) + characters.join();
      default:
        throw Exception('unknown alignment requested');
    }
  }

  static const Align left = const Align._(0, 'Left');

  static const Align center = const Align._(1, 'Center');

  static const Align right = const Align._(2, 'Right');
}
