import 'dart:math' as math;

abstract class Size {
  Size._();
}

class Fixed implements Size {
  final int size;

  const Fixed(this.size);

  Fixed min(Fixed other) => Fixed(math.min(size, other.size));

  Fixed max(Fixed other) => Fixed(math.max(size, other.size));

  Fixed clamp(Size? min, Size? max, {int? totalSize}) {
    int ret = size;

    // Clamp lower
    if (min != null) {
      int lowerSize;
      if (min is Fixed) {
        lowerSize = min.size;
      } else if (min is Perc) {
        if (totalSize != null) {
          throw UnsupportedError(
              'Percentage min size is invalid without totalSize');
        }
        lowerSize = (totalSize! * min.percentage).floor();
      } else {
        throw UnsupportedError('min size can only be either Fixed or Perc');
      }

      if (ret < lowerSize) {
        ret = lowerSize;
      }
    }

    // Clamp upper
    if (max != null) {
      int upperSize;
      if (max is Fixed) {
        upperSize = max.size;
      } else if (max is Perc) {
        if (totalSize != null) {
          throw UnsupportedError(
              'Percentage maxsize is invalid without totalSize');
        }
        upperSize = (totalSize! * max.percentage).floor();
      } else {
        throw UnsupportedError('max size can only be either Fixed or Perc');
      }

      if (ret > upperSize) {
        ret = upperSize;
      }
    }

    return Fixed(ret);
  }

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

  const Flex(this.flex);
}

class Perc implements Size {
  final double percentage;

  Perc(this.percentage) {
    assert(percentage > 0.0 && percentage <= 1.0);
  }
}

class Padding {
  final int before;

  final int after;

  int get total => before + after;

  const Padding({this.before: 0, this.after: 0});

  const Padding.same(int padding)
      : before = padding,
        after = padding;

  String pad(String content) => (' ' * before) + content + (' ' * after);
}
