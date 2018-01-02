import 'style/style.dart';
import 'dimension/dimension.dart';

class Table {
  final List<String> head;

  final List<Size> columnWidths;

  final List<Align> aligns;

  final String ellipsis;

  Border _border;

  Border get border => _border;

  // TODO align

  set(Border v) {
    if (v == null) throw new ArgumentError.notNull();
    _border = v;
  }

  Table(List<String> head,
      {List<Size> columnWidths = const [],
      Align align,
      List<Align> aligns = const [],
      Border border: Border.def,
      this.ellipsis: '...'})
      : head = new List<String>.unmodifiable(
            head.map((h) => h.toString()).toList(growable: false)),
        columnWidths = _fill(head.length, columnWidths, flex(1)),
        aligns = _fill(head.length, aligns, align ?? Align.left),
        _border = border {
    if (columnWidths.length > head.length)
      throw new ArgumentError.value(
          columnWidths, 'width', 'More columns widths provided that columns!');
  }

  final _rows = <List<String>>[];

  void row(List<dynamic> cells) {
    if (cells.length != head.length)
      throw new ArgumentError.value(
          cells, 'cells', 'More cells in the row than expected!');
    _rows.add(new List<String>.unmodifiable(cells.map((c) => c.toString())));
  }

  int get numColumns => head.length;

  String toString() {
    // TODO compute flex widths

    final List<int> widths =
        columnWidths.map((size) => size.size).toList(growable: false);
    final int totalWidth = Size.fixedAdd(columnWidths) + numColumns + 1;

    final sb = new StringBuffer();

    if (head.any((s) => s.isNotEmpty)) {
      {
        final LineStyle sepStyle = border.topLine;
        if (sepStyle.left.isNotEmpty ||
            sepStyle.horizontal.isNotEmpty ||
            sepStyle.intersection.isNotEmpty ||
            sepStyle.right.isNotEmpty)
          sb.writeln(TableDrawer.line(widths, totalWidth, border.topLine));
      }

      sb.writeln(TableDrawer.singleLineRow(
          head, widths, aligns, ellipsis, border.contentLine));

      if (_rows.length > 1) {
        sb.writeln(TableDrawer.line(widths, totalWidth, border.headLine));
      }
    }

    for (List<String> cells in _rows) {
      sb.writeln(TableDrawer.singleLineRow(
          cells, widths, aligns, ellipsis, border.contentLine));

      if (cells != _rows.last) {
        final LineStyle sepStyle = border.separatorLine;
        if (sepStyle.left.isNotEmpty ||
            sepStyle.horizontal.isNotEmpty ||
            sepStyle.intersection.isNotEmpty ||
            sepStyle.right.isNotEmpty) {
          sb.writeln(
              TableDrawer.line(widths, totalWidth, border.separatorLine));
        }
      }
    }

    {
      final LineStyle sepStyle = border.bottomLine;
      if (sepStyle.left.isNotEmpty ||
          sepStyle.horizontal.isNotEmpty ||
          sepStyle.intersection.isNotEmpty ||
          sepStyle.right.isNotEmpty)
        sb.writeln(TableDrawer.line(widths, totalWidth, border.bottomLine));
    }

    return sb.toString();
  }
}

List<T> _fill<T>(int length, List<T> width, T fill) {
  return new List<T>.unmodifiable(
      width.toList()..addAll(new List<T>.filled(length - width.length, fill)));
}

class Align {
  final int id;

  final String text;

  const Align._(this.id, this.text);

  static const Align left = const Align._(0, 'Left');

  static const Align center = const Align._(1, 'Center');

  static const Align right = const Align._(2, 'Right');
}

class TableDrawer {
  static String line(List<int> colWidths, int totalWidth, LineStyle style) {
    final str = new List<String>.filled(totalWidth, style.horizontal);
    str[0] = style.left;
    str[str.length - 1] = style.right;

    if (colWidths.length > 1) {
      int pos = 0;
      for (final int size in colWidths.sublist(0, colWidths.length - 1)) {
        pos += size + 1;
        str[pos] = style.intersection;
      }
    }

    return str.join();
  }

  static String row(List<String> cells, LineStyle style) {
    return style.left + cells.join(style.intersection) + style.right;
  }

  static String singleLineCell(
      int width, String value, Align align, String ellipsis) {
    if (value.length == width) {
      return value;
    } else if (value.length > width) {
      if (width >= ellipsis.length) {
        return ellipsis.substring(0, width);
      } else {
        return value.substring(0, width - ellipsis.length) + ellipsis;
      }
    }

    switch (align) {
      case Align.left:
        return value + (' ' * (width - value.length));
        break;
      case Align.center:
        final int spaces = width - value.length;
        return (' ' * (spaces ~/ 2)) +
            value +
            (' ' * (spaces ~/ 2)) +
            (spaces.isOdd ? ' ' : '');
        break;
      case Align.right:
        return (' ' * (width - value.length)) + value;
        break;
      default:
        throw new UnsupportedError('Unsupported alignment!');
    }
  }

  static String singleLineRow(List<String> cells, List<int> widths,
      List<Align> aligns, String ellipsis, LineStyle style) {
    final renderedCells = <String>[];
    for (int i = 0; i < cells.length; i++) {
      renderedCells.add(
          TableDrawer.singleLineCell(widths[i], cells[i], aligns[i], ellipsis));
    }

    return TableDrawer.row(renderedCells, style);
  }
}

Table table(List<dynamic> head,
        {List<Size> columnWidths = const [],
        Align align,
        List<Align> aligns = const [],
        Border border: Border.def,
        String ellipsis: '...'}) =>
    new Table(head,
        columnWidths: columnWidths,
        align: align,
        aligns: aligns,
        border: border,
        ellipsis: ellipsis);
