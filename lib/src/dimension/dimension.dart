class Size {
  final int size;

  final bool isFixed;

  bool get isInfinite => !isFixed && size == 0;

  Size(this.size, {this.isFixed: true});

  static int fixedAdd(List<Size> widths) {
    int ret = 0;
    for (Size size in widths) {
      if (!size.isFixed)
        throw new UnsupportedError('Flexible sizes are not supported!');
      ret += size.size;
    }
    return ret;
  }
}

Size fixed(int value) => new Size(value);

Size flex(int value) => new Size(value, isFixed: false);
