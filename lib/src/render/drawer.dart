import 'dart:collection';
import 'dart:math';
import 'package:collection/collection.dart';
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

  static String drawDataLine(List cells, LineStyle style) {
    return style.left + cells.join(style.intersection) + style.right;
  }

  /*static String drawCell(int width, value, Align align, String ellipsis) {
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

  static String singleLineRow(List cells, List<int> widths, List<Align> aligns,
      String ellipsis, LineStyle style, List<Padding> pads) {
    final renderedCells = <String>[];
    for (int i = 0; i < cells.length; i++) {
      renderedCells.add(pads[i]
          .pad(TableDrawer.drawCell(widths[i], cells[i], aligns[i], ellipsis)));
    }

    return TableDrawer.drawDataLine(renderedCells, style);
  }*/

  static List<String> drawRow(List cells, List<int> widths, List<Align> aligns,
      String ellipsis, LineStyle style, List<Padding> pads) {
    final ret = <String>[];
    final raw = makeCells(cells, widths, aligns, pads);
    for (int i = 0; i < raw.first.length; i++) {
      ret.add(drawDataLine(raw.map((e) => e[i]).toList(), style));
    }
    return ret;
  }

  static List<String> toMultilineOneCell(String data, int width, Align align) {
    if (width == 0) {
      return [];
    }
    return _window(Characters(data), width, align);
  }

  static List<List<String>> makeCells(
      List cells, List<int> widths, List<Align> aligns, List<Padding> padding) {
    final lines = cells
        .mapIndexed((i, e) =>
            toMultilineOneCell(e?.toString() ?? '', widths[i], aligns[i]))
        .toList();
    final maxLines =
        lines.fold(0, (int p, element) => max<int>(p, element.length));
    for (final line in lines) {
      line.addAll(Iterable.generate(
          maxLines - line.length, (_) => ' ' * line.first.length));
    }
    lines.forEachIndexed((i, lines) =>
        lines.forEachIndexed((j, line) => lines[j] = padding[i].pad(line)));
    return lines;
  }
}

List<String> _window(Iterable<String> input, int count, Align align) {
  final ret = <String>[];
  if (count == 0) {
    return ret;
  }

  var cur = <String>[];

  for (final item in input) {
    cur.add(item);
    if (cur.length == count) {
      ret.add(cur.join());
      cur = <String>[];
    }
  }

  if (cur.isNotEmpty) {
    ret.add(align.align(cur, count));
  }

  return ret;
}
