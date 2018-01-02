abstract class Size {
  bool get isFixed;
  bool get isFlex;
}

class Fixed implements Size {
  final int size;

  final bool isFixed = true;

  final bool isFlex = false;

  const Fixed(this.size);

  static int sum(List<Fixed> sizes) {
    int ret = 0;
    for (Fixed size in sizes) {
      if (!size.isFixed)
        throw new UnsupportedError('Flexible sizes are not supported!');
      ret += size.size;
    }
    return ret;
  }

  static Iterable<int> toInt(List<Fixed> sizes) =>
      sizes.map((size) => size.size);
}

class Flex implements Size {
  final int flex;

  final bool isFixed = false;

  final bool isFlex = true;

  bool get isTight => flex == 0;

  const Flex(this.flex);
}

Fixed fixed(int value) => new Fixed(value);

Flex flex(int value) => new Flex(value);

Flex get tight => new Flex(0);

class Padding {
  final int before;

  final int after;

  int get total => before + after;

  const Padding({this.before: 0, this.after: 0});

  String pad(String content) => (' ' * before) + content + (' ' * after);
}

Padding pad({int before: 0, int after: 0}) =>
    new Padding(before: before, after: after);

Padding padEven(int pad) => new Padding(before: pad, after: pad);
