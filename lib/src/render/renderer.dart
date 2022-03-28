import 'dart:math';
import 'package:collection/collection.dart';

import '../style/style.dart';
import '../dimension/dimension.dart';
import 'sizing.dart';
import 'drawer.dart';

// String renderTable

class Column {
  final String? name;

  final Size? width;

  final Fixed? minWidth;

  final Fixed? maxWidth;

  final Padding? padding;

  final Align align;

  final bool multiline;

  Column(
      {this.name,
      this.width,
      this.minWidth,
      this.maxWidth,
      this.padding,
      this.align = Align.left,
      this.multiline = true});

  static List<Column> fromNames(Iterable<String> names) =>
      names.map((e) => Column(name: e)).toList();
}

class TableRenderer {
  final Border border;

  final Fixed? minColWidth;

  final Fixed? maxColWidth;

  final Padding padding;

  final String ellipsis;

  const TableRenderer(
      {this.border = Border.def,
      this.minColWidth,
      this.maxColWidth,
      this.padding = const Padding(),
      this.ellipsis: '...'});

  String render(Iterable<List> rows,
      {bool withHead = true,
      List? /* <String | Column> */ columns,
      int? width}) {
    if (columns == null) {
      withHead = false;
      final firstRow = rows.firstOrNull;
      if (firstRow == null || firstRow.isEmpty) {
        columns = <Column>[];
      } else {
        columns = List<Column>.filled(firstRow.length, Column());
      }
    } else if (columns.every((e) => e is String)) {
      columns = Column.fromNames(columns.cast<String>());
    } else if (columns.every((e) => e is Column)) {
      columns = columns.cast<Column>();
    }

    if (columns is! List<Column>) {
      throw ArgumentError('invalid argument', 'columns');
    }

    final paddings = columns.map((e) => e.padding ?? padding).toList();
    final aligns = columns.map((e) => e.align).toList();

    final decorWidth = ((columns.length - 1) * border.contentIntersect.length) +
        border.contentLeft.length +
        border.contentRight.length +
        paddings.map((p) => p.total).reduce((p, c) => p + c);
    final colSpecs = columns
        .mapIndexed((i, e) => ColumnSpec(
            width: e.width,
            min: e.minWidth ?? minColWidth,
            max: e.maxWidth ?? maxColWidth,
            dataLength: _findLongest(e.name ?? '', rows, i),
            pad: e.padding ?? padding,
            multiline: e.multiline))
        .toList();

    List<Fixed> estimated;
    int totalWidth;

    if (width == null) {
      estimated = estimateColumnSizes(colSpecs);
      totalWidth = Fixed.sum(estimated) + decorWidth;
    } else {
      totalWidth = width;
      estimated =
          estimateColumnSizeWithTotalWidth(totalWidth - decorWidth, colSpecs);
    }

    final List<int> widths = Fixed.toInt(estimated).toList(growable: false);

    final sb = StringBuffer();

    if (withHead) {
      {
        final LineStyle sepStyle = border.topLine;
        if (sepStyle.left.isNotEmpty ||
            sepStyle.horizontal.isNotEmpty ||
            sepStyle.intersection.isNotEmpty ||
            sepStyle.right.isNotEmpty)
          sb.writeln(TableDrawer.drawRowSeparator(
              widths, totalWidth, border.topLine, paddings));
      }

      sb.writeln(TableDrawer.singleLineRow(
          columns.map((e) => e.name ?? '').toList(),
          widths,
          aligns,
          ellipsis,
          border.contentLine,
          paddings));

      if (rows.length > 0) {
        sb.writeln(TableDrawer.drawRowSeparator(
            widths, totalWidth, border.headLine, paddings));
      }
    } else {
      sb.writeln(TableDrawer.drawRowSeparator(
          widths, totalWidth, border.topLine, paddings));
    }

    for (List cells in rows) {
      sb.writeln(TableDrawer.singleLineRow(
          cells, widths, aligns, ellipsis, border.contentLine, paddings));

      if (cells != rows.last) {
        final LineStyle sepStyle = border.separatorLine;
        if (sepStyle.left.isNotEmpty ||
            sepStyle.horizontal.isNotEmpty ||
            sepStyle.intersection.isNotEmpty ||
            sepStyle.right.isNotEmpty) {
          sb.writeln(TableDrawer.drawRowSeparator(
              widths, totalWidth, border.separatorLine, paddings));
        }
      }
    }

    {
      final LineStyle sepStyle = border.bottomLine;
      if (sepStyle.left.isNotEmpty ||
          sepStyle.horizontal.isNotEmpty ||
          sepStyle.intersection.isNotEmpty ||
          sepStyle.right.isNotEmpty)
        sb.writeln(TableDrawer.drawRowSeparator(
            widths, totalWidth, border.bottomLine, paddings));
    }

    return sb.toString();
  }
}

int _findLongest(String name, Iterable<List> values, int index) {
  int length = name.length;

  for (final row in values) {
    length = max(length, (row[index]?.toString() ?? '').length);
  }

  return length;
}
