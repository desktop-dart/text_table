library text_table.core;

import '../style/style.dart';
import '../dimension/dimension.dart';

part 'drawer.dart';
part 'sizing.dart';

/// Model to construct a table and its style
class Table {
  final List<String> head;

  int width;

  final List<Size> colWidths;

  final List<Fixed> minColWidths;

  final List<Fixed> maxColWidths;

  final List<Padding> padding;

  final List<Align> aligns;

  final List<bool> multiline;

  final String ellipsis;

  Border border;

  Table(List<String> head,
      {this.width: 0,
      Size globalColWidth: const Flex(0),
      List<Size> colWidths = const [],
      Fixed globalMinColWidth,
      List<Fixed> minColWidths = const [],
      Fixed globalMaxColWidth,
      List<Fixed> maxColWidths = const [],
      Padding globalPadding: const Padding(),
      List<Padding> padding = const [],
      Align globalAlign: Align.left,
      List<Align> aligns = const [],
      bool globalMultiline = false,
      List<bool> multiline = const [],
      Border border: Border.def,
      this.ellipsis: '...'})
      : head = new List<String>.unmodifiable(
            head.map((h) => h?.toString()).toList(growable: false)),
        colWidths = _fill(head.length, colWidths, globalColWidth),
        minColWidths = _fill(head.length, minColWidths, globalMinColWidth),
        maxColWidths = _fill(head.length, maxColWidths, globalMaxColWidth),
        padding = _fill(head.length, padding, globalPadding),
        aligns = _fill(head.length, aligns, globalAlign),
        multiline = _fill(head.length, multiline, globalMultiline),
        border = border {
    if (colWidths.length > head.length)
      throw new ArgumentError.value(
          colWidths, 'width', 'More columns widths provided that columns!');
  }

  final _rows = <List<String>>[];

  void row(List<dynamic> cells) {
    if (cells.length != head.length)
      throw new ArgumentError.value(
          cells, 'cells', 'More cells in the row than expected!');
    _rows.add(new List<String>.unmodifiable(cells.map((c) => c.toString())));
  }

  int get numColumns => head.length;

  List<int> get _largest {
    final ret = new List<int>(head.length);

    for (int i = 0; i < head.length; i++) {
      int max = head[i] != null ? head[i].length : 0;
      for (int j = 0; j < _rows.length; j++) {
        if (_rows[j][i].length > max) max = _rows[j][i].length;
      }
      ret[i] = max > 0 ? max : 1;
    }

    return ret;
  }

  String toString() {
    List<Fixed> estimated;
    int totalWidth;

    if (width == 0) {
      estimated = _estimateSize(
          colWidths, _largest, multiline, minColWidths, maxColWidths);
      totalWidth = Fixed.sum(estimated) +
          ((numColumns - 1) * border.contentIntersect.length) +
          border.contentLeft.length +
          border.contentRight.length +
          padding.map((p) => p.total).reduce((p, c) => p + c);
    } else {
      totalWidth = width;
      estimated = _estimateFlex(totalWidth, colWidths, _largest, multiline,
          minColWidths, maxColWidths, padding);
    }

    final List<int> widths = Fixed.toInt(estimated).toList(growable: false);

    final sb = new StringBuffer();

    if (head.any((s) => s != null && s.isNotEmpty)) {
      {
        final LineStyle sepStyle = border.topLine;
        if (sepStyle.left.isNotEmpty ||
            sepStyle.horizontal.isNotEmpty ||
            sepStyle.intersection.isNotEmpty ||
            sepStyle.right.isNotEmpty)
          sb.writeln(
              TableDrawer.line(widths, totalWidth, border.topLine, padding));
      }

      sb.writeln(TableDrawer.singleLineRow(
          head, widths, aligns, ellipsis, border.contentLine, padding));

      if (_rows.length > 1) {
        sb.writeln(
            TableDrawer.line(widths, totalWidth, border.headLine, padding));
      }
    } else {
      sb.writeln(TableDrawer.line(widths, totalWidth, border.topLine, padding));
    }

    for (List<String> cells in _rows) {
      sb.writeln(TableDrawer.singleLineRow(
          cells, widths, aligns, ellipsis, border.contentLine, padding));

      if (cells != _rows.last) {
        final LineStyle sepStyle = border.separatorLine;
        if (sepStyle.left.isNotEmpty ||
            sepStyle.horizontal.isNotEmpty ||
            sepStyle.intersection.isNotEmpty ||
            sepStyle.right.isNotEmpty) {
          sb.writeln(TableDrawer.line(
              widths, totalWidth, border.separatorLine, padding));
        }
      }
    }

    {
      final LineStyle sepStyle = border.bottomLine;
      if (sepStyle.left.isNotEmpty ||
          sepStyle.horizontal.isNotEmpty ||
          sepStyle.intersection.isNotEmpty ||
          sepStyle.right.isNotEmpty)
        sb.writeln(
            TableDrawer.line(widths, totalWidth, border.bottomLine, padding));
    }

    return sb.toString();
  }
}

List<T> _fill<T>(int length, List<T> present, T fill) {
  final ret = new List<T>.filled(length, fill);
  for (int i = 0; i < present.length; i++) {
    ret[i] = present[i];
  }
  return ret;
}

/// Convenience function to build [Table]
Table table(List<String> head,
        {int width: 0,
        Size globalColWidth: const Flex(0),
        List<Size> colWidths = const [],
        Fixed globalMinColWidth,
        List<Fixed> minColWidths = const [],
        Fixed globalMaxColWidth,
        List<Fixed> maxColWidths = const [],
        Padding globalPadding: const Padding(),
        List<Padding> padding = const [],
        Align globalAlign: Align.left,
        List<Align> aligns = const [],
        bool globalMultiline = false,
        List<bool> multiline = const [],
        Border border: Border.def,
        String ellipsis: '...'}) =>
    new Table(head,
        width: width,
        globalColWidth: globalColWidth,
        colWidths: colWidths,
        globalMinColWidth: globalMinColWidth,
        minColWidths: minColWidths,
        globalMaxColWidth: globalMaxColWidth,
        maxColWidths: maxColWidths,
        globalPadding: globalPadding,
        padding: padding,
        globalAlign: globalAlign,
        aligns: aligns,
        globalMultiline: globalMultiline,
        multiline: multiline,
        border: border,
        ellipsis: ellipsis);

List<String> noHead(int numCols) => new List<String>.filled(numCols, '');
