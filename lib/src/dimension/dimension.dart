abstract class Size {
  Size._();
}

class Fixed implements Size {
  final int size;

  const Fixed(this.size);

  static int sum(List<Fixed> sizes) {
    int ret = 0;
    for (Fixed size in sizes) {
      ret += size.size;
    }
    return ret;
  }

  static Iterable<int> toInt(List<Fixed> sizes) =>
      sizes.map((size) => size.size);
}

class Flex implements Size {
  final int flex;

  bool get isTight => flex == 0;

  const Flex(this.flex);
}

Fixed fixed(int value) => Fixed(value);

Flex flex(int value) => Flex(value);

Flex get tight => Flex(0);

class Padding {
  final int before;

  final int after;

  int get total => before + after;

  const Padding({this.before: 0, this.after: 0});

  String pad(String content) => (' ' * before) + content + (' ' * after);
}

Padding pad({int before: 0, int after: 0}) =>
    Padding(before: before, after: after);

Padding padEven(int pad) => Padding(before: pad, after: pad);
