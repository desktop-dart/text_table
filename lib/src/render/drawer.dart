import '../dimension/dimension.dart';
import '../style/style.dart';

class TableDrawer {
  static String line(List<int> colWidths, int totalWidth, LineStyle style,
      List<Padding> padding) {
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
