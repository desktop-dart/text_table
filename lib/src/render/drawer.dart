import 'dart:collection';
import 'package:characters/characters.dart';

import '../dimension/dimension.dart';
import '../style/style.dart';

class TableDrawer {
  static String drawRowSeparator(List<int> colWidths, int totalWidth,
      LineStyle style, List<Padding> padding) {
    final str = List<String>.filled(totalWidth, style.horizontal);
    str[0] = style.left;
    str[str.length - 1] = style.right;

    if (colWidths.length > 1) {
      int pos = 0;
      for (int i = 0; i < colWidths.length - 1; i++) {
        pos += colWidths[i] + 1;
        pos += padding[i].total;
        str[pos] = style.intersection;
      }
    }

    return str.join();
  }

  static String row(List cells, LineStyle style) {
    return style.left + cells.join(style.intersection) + style.right;
  }

  static String singleLineCell(int width, value, Align align, String ellipsis) {
    final v = value?.toString() ?? '';
    if (v.length == width) {
      return v;
    } else if (v.length > width) {
      if (ellipsis.length >= width) {
        return ellipsis.substring(0, width);
      } else {
        return v.substring(0, width - ellipsis.length) + ellipsis;
      }
    }

    switch (align) {
      case Align.left:
        return v + (' ' * (width - v.length));
      case Align.center:
        final int spaces = width - v.length;
        return (' ' * (spaces ~/ 2)) +
            v +
            (' ' * (spaces ~/ 2)) +
            (spaces.isOdd ? ' ' : '');
      case Align.right:
        return (' ' * (width - v.length)) + v;
      default:
        throw UnsupportedError('Unsupported alignment!');
    }
  }

  static List<String> toMultiline(String data, int width, Align align) {
    if(width == 0) {
      return [];
    }
    final ret = _window(Characters(data), width);
    if(ret.last.length != width) {
      // TODO
    }
    // TODO
  }

  static String singleLineRow(List cells, List<int> widths, List<Align> aligns,
      String ellipsis, LineStyle style, List<Padding> pads) {
    final renderedCells = <String>[];
    for (int i = 0; i < cells.length; i++) {
      renderedCells.add(pads[i].pad(TableDrawer.singleLineCell(
          widths[i], cells[i], aligns[i], ellipsis)));
    }

    return TableDrawer.row(renderedCells, style);
  }
}

List<String> _window(Iterable<String> input, int count, Align align) {
  final ret = <String>[];
  if(count == 0) {
    return ret;
  }

  var cur = <String>[];

  for(final item in input) {
    cur.add(item);
    if(cur.length == count) {
      ret.add(cur.join());
      cur = <String>[];
    }
  }

  if(cur.isNotEmpty) {
    ret.add(align.align(cur, count));
  }

  return ret;
}
